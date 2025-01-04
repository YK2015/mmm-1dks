function M = assemble_mass_1d(P,T,bas_val,gp_jxw)
% assemble the mass matrix
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
% ouput:
%   M - mass matrix

    matrix_size = [length(P),length(P)];
    M = sparse(matrix_size(1),matrix_size(2));    
    for n = 1:size(T,2)
        M(T(:,n),T(:,n))=M(T(:,n),T(:,n))+bas_val*(bas_val'.*gp_jxw(n,:)');
    end

end