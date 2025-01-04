function val = fem_basis_value(basis_type,basis_index,basis_der)
% return the value for basis functions (or derivatives) at gaussian points
%
% inputs
%   gauss_point: gauss point(s)
%   basis_type : 101 or 102 or 103
%   basis_index: which basis function
%   basis_der  : degree of derivative
% 
    [gauss_weight,gauss_point] = gaussValues_1d(basis_type-100+1);
    interval1 = [-1 1];
    x = gauss_point;
    val = zeros(1,size(x,2));
    for i = 1:size(x,2)
        val(i) = FE_basis_local_fun_1D(x(i),interval1,basis_type,basis_index,basis_der);
    end
    
end