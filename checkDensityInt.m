function val=checkDensityInt(density,gp_all,gp_jxw)
    val = 0;
    for n = 1:size(density,1)
        val = val + 4*pi*density(n,:).*gp_all(n,:).^2*gp_jxw(n,:)';
    end
end