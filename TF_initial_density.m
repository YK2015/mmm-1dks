function rho = TF_initial_density(r,Z)
% initial density from Thomas–Fermi (TF) approximation 
%
% Ref: M. Oulne, Variation and series approach to the Thomas–Fermi 
% equation, Appl. Math. Comput. 218 (2) (2011) 303�?07, 
% https://doi.org/10.1016/j.amc.2011.05.064.
% 
% Inputs: 
%   r - radial position, could be a matrix
%   Z - nucleus charge
%   
% Outputs
%   rho - electron density 

    alpha = 0.7280642371;
    beta  =-0.5430794693;
    gamma = 0.3612163121;

    x    = (128*Z/(9 * pi^2))^(1/3)*r;
    sq_x = sqrt(x);
    Zeff = Z*(1 + alpha*sq_x + beta*x.*exp(-gamma*sq_x)).^2 ...
        .* exp(-2*alpha*sq_x);
    v_r  = -Zeff./r;
    
    rho = 1/(3 *pi^2)*(-2*v_r).^(3/2);

end
