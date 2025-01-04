clear all;
basis_type  = 103;
poly_degree = basis_type-100;
n_basis = poly_degree+1;
excelFile = '1d_basis_info/basis_info.xlsx';
for n = 1:n_basis
    val(n,:) = fem_basis_value(basis_type,n,1);
end
writematrix(val,excelFile,'Sheet','cubic-d1','WriteMode','append');