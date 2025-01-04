function  VH_new=V_hartree(VH,num_of_element,gauss_type,trial_basis_type)

%num_Gauss_points = 4; % 高斯点的个数（因为单元上的积分使用的是高斯积分公式）
VH_new = zeros(num_of_element, gauss_type); % 用于存储结果的矩阵
n = zeros(gauss_type, 1); 
for e = 1:num_of_element % 按单元扫描    
    [~,gauss_point] = gaussValues_1d(gauss_type);
    switch trial_basis_type
        case 101
                n= VH(e)*(1+gauss_point)/2+VH(e+1)*(1-gauss_point)/2;

        case 102
                n=VH(2*e-1)*(gauss_point.^2-gauss_point)/2+VH(2*e)*(1-gauss_point.^2)+VH(2*e+1)*(gauss_point.^2+gauss_point)/2;

        case 103
                n= VH(3*e-2)*(1/16)*(9*gauss_point.^2-9*gauss_point.^3-1+gauss_point)+VH(3*e-1)*(9/16)*(3*gauss_point.^3-gauss_point.^2-3*gauss_point+1)+VH(3*e)*(9/16)*(-3*gauss_point.^3-gauss_point.^2+3*gauss_point+1)+VH(3*e+1)*(1/16)*(9*gauss_point.^2+9*gauss_point.^3-1-gauss_point);

    end
    % 将当前单元的结果存储到矩阵的相应行
    VH_new(e, :) = n';
end