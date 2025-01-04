function [vxc,uxc] = VxcPZ(rho)
% VXCPZ PZ exchange correlation.
%     [vxc,uxc,rho] = VXCPZ(rho) returns the PZ exchange correlation of the
%     rho.
% 
% Input: 
%     rho the electron density
%
% Output:
%     vxc the exchange-correlation potential
%     uxc the exchange-correlation energy


vxc = zeros(size(rho));
uxc = zeros(size(rho));

%idxxc = rho > 1e-10;
%rhoxc = rho(idxxc);

rs      = ((3/(4*pi))./rho).^(1/3);
[vx,ux] = VExchange_sla(rs);
[vc,uc] = VCorrelation_pz(rs);

vxc = vx+vc;
uxc = ux+uc;
end
