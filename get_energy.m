function [E,e_kin,e_har,e_xc,e_ext]=get_energy(eigenvalue,focc,Z,P,T,gp_all,gp_jxw,density,VH)

e_har = 0;
e_xc  = 0;
e_ext = 0;
e_vxc = 0;
e_kin = 0;

n_element = size(T,2);

for n = 1:n_element%±éÀúµ¥Ôª

    gauss_point_local  = gp_all(n,:);
    gauss_weight_local = gp_jxw(n,:);
    
    VH_local = VH(n,:);
    Vext = -Z./gauss_point_local;
    rho_ele = density(n,:);
    [Vxc,Uxc]=VXCfun(rho_ele);

    tmp_val = (gauss_weight_local.*rho_ele.*(gauss_point_local.^2))';

    % Hartree energy
    e_har = e_har + 2*pi*VH_local*tmp_val;
    
    % xc enegy
    e_xc  = e_xc  + 4*pi*Uxc*tmp_val;
    
    % ext energy
    e_ext = e_ext + 4*pi*Vext*tmp_val;

    % vxc energy
    e_vxc = e_vxc + 4*pi*Vxc*tmp_val;

end

E = focc*eigenvalue - e_har + e_xc - e_vxc;
e_kin = E-e_har-e_xc-e_ext;
