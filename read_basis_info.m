function [bas_val,bas_grad] = read_basis_info(basis_type)
%     excelFile = '1d_basis_info/basis_info.xlsx';
%     if basis_type == 101
%         bas_val  = readmatrix(excelFile,'Sheet','linear');
%         bas_grad = readmatrix(excelFile,'Sheet','linear-d1');
%     elseif basis_type == 102
%         bas_val  = readmatrix(excelFile,'Sheet','quadratic');
%         bas_grad = readmatrix(excelFile,'Sheet','quadratic-d1');
%     elseif basis_type == 103
%         bas_val  = readmatrix(excelFile,'Sheet','cubic');
%         bas_grad = readmatrix(excelFile,'Sheet','cubic-d1');
%     else
%         warining('I dont construct this kind of element.');
%     end
    
    p = basis_type-100; % polynomial degree
    N = p+1; % the number of basis functions
    gauss_type = p+1; % the number of gauss points
    [~,gauss_point] = gaussValues_1d(gauss_type);
    bas_val  = zeros(N,gauss_type);
    bas_grad = zeros(N,gauss_type);
    for k = 1:N
        bas_val(k,:) = Lagrange_basis_function(gauss_point,p,k,0);
        bas_grad(k,:)= Lagrange_basis_function(gauss_point,p,k,1);
    end
    
end