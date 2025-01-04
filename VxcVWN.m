function [vxc,exc]  = VxcVWN(rho)
    % rho: 电子密度 (必须是非负的)
    % 输出:
    %   exc: 交换关联能/电子
    %   vxc: 交换关联势


    % 计算关联能
    y0=-0.10498;
    b=3.72744;
    c=12.9352;
    A=0.0621814;
    
    Q=(4*c-b^2)^(1/2);
    rs=(3./(4*pi*rho)).^(1/3);
    y=rs.^(1/2);
    Y=y.^2+b*y+c;
    Yy0 = y0.^2+b*y0+c;
    
    ex =-3*(3*pi^2*rho).^(1/3)/(4*pi);
    ec =(A/2)*( log(y.^2./Y)+(2*b/Q)*atan(Q./(2*y+b)) ...
        -(b*y0/Yy0)*( log((y-y0).^2./Y) ...
        + 2*(b+2*y0)/Q*atan(Q./(2*y+b))));

    % 计算交换关联能/电子
    exc = ex + ec;

    % 计算交换势和关联势
    vx =(4/3)*ex;    
    vc = ec- (A/6)*(c*(y-y0)-b*y0*y)./((y-y0).*Y);
    vxc = vx + vc;
end

