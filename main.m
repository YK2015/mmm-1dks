%clear all;
%% atom species
function [PALL,eigenvalue]=main(element_number,basis_type,num_of_element)
ac = read_atomic_config(element_number);
atom_name = ac.atom_name;
Z         = ac.Z;     
focc      = ac.focc;   
fnl       = ac.fnl;   
E_ref     = ac.E_ref; 
n_angular = ac.n_angular;  
ev_index  = ac.ev_index;   
n_orbital = size(focc,2);

fprintf('=======Atom Info==================\n');
fprintf('|\tAtom\t|%s\n',atom_name);
fprintf('|\tCharge\t|%d\n',Z);
fprintf('|\tNocc\t|%d\n',n_orbital);
fprintf('|\tOccNum\t| nl\t| fnl\n');
for n = 1:size(fnl,2)
    fprintf('|\t\t\t| %s\t| %d\n', fnl(n),focc(n));
end
fprintf('==================================\n');

%% Finite element space
L=40;  % domain [0,L]
gauss_type = basis_type-100+1;
% read the basis information
[bas_val,bas_grad] = read_basis_info(basis_type);

% build finite element space
[P,T] = generate_PbTb(num_of_element,basis_type,L); 
fprintf('====FE space Info=================\n');
fprintf('|\tFE order | %d\t\n',gauss_type-1);
fprintf('|\tN_ele    | %d\t\n',num_of_element);
fprintf('|\tN_node   | %d\t\n',length(P));
fprintf('==================================\n');

% update guass quadrature information
[gp_all, gp_jxw] = update_gauss_info(P,T,gauss_type);

%% main routine
tic;
E = 100; E_old = 0;
step = 0;c=0;d=0;
density = TF_initial_density(gp_all,Z);
PALL = zeros(num_of_element+1,5);
PALL(end,:) = L;
    
% initial eigenvalue and eigenvecor
eval_init  = zeros(n_orbital,1);
evec_init = rand(length(P),n_orbital);
evec_init(1,:) = 0; 
evec_init(end,:) = 0;
Pold = P;
diffP = 1;
while(step < 5)
 
    step = step+1;
    E_old = E;
    PALL(1:end-1,step) = P(T(1,:))'; 
    figure(1);
    semilogx(PALL(:,step),step-1,'-o','Color','black', 'MarkerSize', 3); hold on;
    yline(step-1);
    [E,eigenvalue,eigenvector,~,convergence_error2,VH] = SCF(ac,P,T,L,bas_val,bas_grad,gp_all,gp_jxw,density,eval_init,evec_init);
    if abs(E-E_old)<1.0e-6 || diffP < 1.0e-2
        break;
    end

    [P,gp_all,gp_jxw,density,mValue,evec_init] = moving_mesh(P,T,eigenvector,focc); 
    diffP = norm(Pold-P,2); Pold = P;
    val = checkDensityInt(density,gp_all,gp_jxw);
    density = Z*density/val;
    eval_init = eigenvalue;
end

toc;



