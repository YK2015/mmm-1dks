function b = assemble_rhs_1dVH(bas_val,gp_jxw, density,P, T)
% generate the right hand side for the Hartree Poisson equation
%
% Inputs:
%   bas_val - values for the basis functions on the guass points on the
%             reference interval
%   gp_jxw  - Jacobian x gauss_weight for all the subintervals
%   density - electron density at the quadrature points
%   P       - nodes on the interval
%   T       - indices for the nodes 
%
% Output:
%   b   - right hand side vector 

    b = zeros(size(P,2),1);
    for n = 1:size(T,2)
        gp_jxw_local = gp_jxw(n,:);
        nn = density(n,:);
        b(T(:,n)) = b(T(:,n)) + 4*pi*bas_val*(gp_jxw_local.*nn)';
    end

end