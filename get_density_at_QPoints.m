function  n_new=get_density_at_QPoints(sol,focc,P,T,bas_val,gp_all)

num_of_element = size(T,2);
n_q_points     = size(gp_all,2);
n_orbital      = size(sol,2);
n_new          = zeros(num_of_element,n_q_points);
PP             = zeros(num_of_element,n_q_points,n_orbital);

% val = \int PP^2 dr
for n = 1:num_of_element
    for l = 1:n_orbital
        PP(n,:,l) = sol(T(:,n),l)'*bas_val;
    end
end

%PP = PP/sqrt(val);
% normalization \int PP^2 dr = 1:
% nn = (1/4*pi)*2*(PP.^2./gauss_point_local.^2)
for n = 1:num_of_element
    gauss_point_local  = gp_all(n,:);
    for l = 1:n_orbital
        pp = PP(n,:,l);    
        n_new(n, :) = n_new(n,:) ...
            + focc(l)*1/(4*pi)*(pp.^2./gauss_point_local.^2);
    end
end


% %% check the density
% val_n = 0;
% for n = 1:size(T,2)
%     vertices = P(T(:,n));
%     xl = vertices(1); xr = vertices(2);
%     % change gauss point from reference element to local element( from [-1,1] to [xl,xr] ).
%     gauss_point_local  = gp_all(n,:);
%     gauss_weight_local = gp_jxw(n,:);
%     val_n = val_n + 4*pi*gauss_point_local.^2.*n_new(n,:)*gauss_weight_local';
% end
% fprintf('\t\telectron density = %.8f\n',val_n);


