function y = Lagrange_basis_function(x,p,k,der)
% Largrange basis function on [-1,1]
% 
% inputs:
%   x   - points to evaluate the value, range from [-1,1], (row vector)
%   p   - degree of the polynomial
%   k   - the k-th basis, k ranges from [1,p+1]
%   der - order of degree, from 0 to p, return 0 when der > p
%
% outputs:
%   y   - the value (row vector)

    X = -1:2/p:1;  % interplation points % uniform
    Nx= size(X,2); % number of interpolation points 
    N = size(x,2); % number of calculated points
    y = zeros(1,N);
    if k == 2
        k = p+1;
    elseif k > 2
        k = k-1;
    end
    
    bas_numerator = prod(X(k)-X([1:k-1,k+1:end]));

    %diffs = zeros(N,Nx);
    diffs =  x' - X; % difference between x and interpolation points
    indices = [1:k-1,k+1:Nx];

    % Precompute masks to exclude k and loop index j for all points
    mask = true(Nx, Nx); % Nx x Nx logical array
    for j = 1:Nx
        mask(j, j) = false; % Exclude the diagonal element
    end
    mask(:, k) = false; % Exclude column corresponding to index k


    switch der 
        case 0
            for n = 1:N
                y(n) = prod(diffs(n,indices))/bas_numerator;
            end
        case 1
            for n = 1:N                
                for j = [1:k-1,k+1:Nx]
                    y(n) = y(n) + prod(diffs(n,mask(j,:)));
                end
                y(n) = y(n)/ bas_numerator;
            end
        otherwise
            warning('Currently derivative >=2 is provided ans set to be 0.');

    end


end