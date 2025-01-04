function [E,eigenvalue,eigenvector,density,convergence_error2,VH] = SCF(ac,P,T,L,bas_val,bas_grad,gp_all,gp_jxw,density,eval_init,evec_init)

global M;
global stiff_mat;

atom_name = ac.atom_name;
Z         = ac.Z;
focc      = ac.focc;
fnl       = ac.fnl;
E_ref     = ac.E_ref;
n_angular = ac.n_angular;
ev_index  = ac.ev_index;
n_orbital = size(focc,2);

max_iterations  = 200;
convergence_tol = 2e-9;
alpha_mixing = 0.3; %for u 0.618; % for most atoms



M = assemble_mass_1d(P,T,bas_val,gp_jxw);
M = boundary_process(M);
stiff_mat = assemble_stiff_1d(gp_all, gp_jxw,P, T, bas_val, bas_grad);
stiff_mat = boundary_process(stiff_mat);

VH= generate_Hartree(Z,L,P,T,bas_val,bas_grad,gp_all,gp_jxw,density);
eigenvalue = eval_init;
eigenvector = evec_init;
E = 0;
convergence_error2=[];

for iteration = 1:max_iterations
    % assemble the hamiltonian and apply the boundary condition
    for l = 1:n_angular
        K = assemble_matrix_1dKS(Z,l-1,P,T,bas_val,bas_grad,gp_all,gp_jxw,density,VH);
        K = boundary_process(K);
        idx = ev_index(l)+1:ev_index(l+1);
        [eigenvector(:,idx),eigenvalue(idx),failureFlag,lamHis,resHis] = lobpcg(eigenvector(:,idx),K,M,'lobpcg_precon',1.0e-9,20,0);
    end
    % Construct the electron density
    density_new=get_density_at_QPoints(eigenvector,focc,P,T,bas_val,gp_all);
    % update the electron density
    density_old = density;
    density = (1-alpha_mixing)*density_old+(alpha_mixing)*density_new;

    %val = checkDensityInt(density,gp_all,gp_jxw);
    %fprintf('\t\telectron density = %.8f\n',val);
    convergence_error1=(density-density_old).^2.*gp_jxw;
    convergence_error1=sqrt(sum(convergence_error1(:)));
    % update the Hartree poential, return the Hartree poential on gps
    VH = generate_Hartree(Z,L,P,T,bas_val,bas_grad,gp_all,gp_jxw,density);
    % Evaluate the total energy
    E_old = E;
    [E,~] = get_energy(eigenvalue,focc,Z,P,T,gp_all,gp_jxw,density,VH);
    %          fprintf('%d\t%.8f\t%.10f\t%.2E\t%.8f\n', iteration,convergence_error1, ...
    %             E,abs(E-E_ref),eigenvalue(1));
    if convergence_error1 < convergence_tol %|| abs(E_old - E) < convergence_tol
        fprintf('%d\t%.11f\t%.9f\t%.2E\t%.11f\n', iteration,convergence_error1, ...
            E,abs(E-E_ref),eigenvalue(1));
        %             fprintf('Converged!\n');
        break;
    end
end

end