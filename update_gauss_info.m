function [gp_all, gp_jxw] = update_gauss_info(P,T,gauss_type)
    % gauss quadrature
    [gauss_weight,gauss_point] = gaussValues_1d(gauss_type);% both gauss_point and weight are row vector.
             
    num_of_element = size(T,2);
    % gp_all is the collection of the gaussian points
    % gp_jxw jacobian x weight in each gaussian points
    gp_all = zeros(num_of_element,gauss_type);
    gp_jxw = zeros(num_of_element,gauss_type);
    for n= 1:num_of_element
        vertices = P(T(:,n)); 
        xl = vertices(1); xr = vertices(2);
        gauss_point_local  = xl + (xr - xl)*(1+gauss_point)/2;
        gp_all(n,:) = gauss_point_local;
        gp_jxw(n,:) = gauss_weight*(xr - xl)/2;
    end
end