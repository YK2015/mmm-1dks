function A = assemble_matrix_1dKS(Z,l,P,T,bas_val,bas_grad,gp_all,gp_jxw,density,VH)
% 
% Inputs:
%   l - angular number
    matrix_size = [length(P),length(P)];
    A = sparse(matrix_size(1),matrix_size(2));
    
 
    for n = 1:size(T,2)%遍历单元
        vertices = P(T(:,n));  
        jacobian = (vertices(2)-vertices(1))/2;
        gauss_point_local  = gp_all(n,:);
        gauss_jxw_local    = gp_jxw(n,:);
        gauss_weight = gauss_jxw_local/jacobian;
    
        % external potential
        Vext= -Z./gauss_point_local;
        % Hartree poential on the quadrature points
        VH_e=VH(n,:);
        % electron density on the quadrature points
        nn=density(n,:);
        % xc potential on the quadrature points
        [Vxc,~]=VXCfun(nn);

        V_l = l*(l+1)./(2*gauss_point_local.^2);

   
        A(T(:,n),T(:,n)) = A(T(:,n),T(:,n))...
            + 0.5/jacobian*bas_grad*(bas_grad'.*gauss_weight')...
            + bas_val * (bas_val.*(Vext+VH_e+Vxc+V_l).*gauss_jxw_local)';
    end

end