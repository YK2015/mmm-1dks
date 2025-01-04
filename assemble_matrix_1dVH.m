function A = assemble_matrix_1dVH(gp_all, gp_jxw,P, T, bas_val, bas_grad)
% assemble the matrix for the Hartree Poisson equation
% 
% Inputs:
%   matrix_size - the matrix size
%   guass_point - guass points on the reference interval
%   P           - nodes on the interval
%   T           - indices for the nodes 
%   bas_val     - values for the basis functions on the guass points on the
%                 reference interval
%   bas_grad    - values for the basiss on the gps on [-1,1]
%
% Outputs:
%   A   - the matrix for the 1d hartree potential

    matrix_size = [length(P),length(P)];
    A = sparse(matrix_size(1),matrix_size(2));
    
    for n = 1:size(T,2)
        vertices = P(T(:,n));
        jacobian = (vertices(2)-vertices(1))/2;
        %gauss_point_local  = vertices(1) + jacobian*(1+gauss_point);
        gauss_point_local = gp_all(n,:);
        gauss_weight = gp_jxw(n,:)/jacobian;
        A(T(:,n),T(:,n)) = A(T(:,n),T(:,n))...
            + 1/jacobian*bas_grad*(bas_grad'.*gauss_weight')...
            - 2*bas_val*(bas_grad'.*(gauss_weight./gauss_point_local)');
    end

end
