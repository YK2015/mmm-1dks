function [Pb,Tb] = generate_PbTb(number_of_element,basis_type,L)
% generate the nodes Pb and the node index Tb in interval [0,L]
% 
% Inputs:
%   number_of_element - number of intervals
%   basis_type        - 101 (linear)
%                     - 102 (quadratic)
%                     - 103 (cubic)
%   L                 - right endpoints of the domain
%
% Outputs:
%        let p be the order of element
%   Pb - 1x(pN+1) array; the value of all the points in an ascending order
%   Tb - (p+1)xN array; a index data to quickly achieve the nodes, 
%        specifically, Tb(:,j) return the indices for nodes in the j-th 
%        element, further Tb(1:2,j) return the indices for left and right 
%        endpoint, and Tb(3:,j) return the other node index in an ascending
%        order


    N = number_of_element;
    p = basis_type - 100;
    
    %% uniform mesh 
%     h = L/(p*N);
%     Pb = 0:h:L;

    %% HelFEM exponential grid
    Pnode = zeros(N+1,1);
    for i = 1:N+1
        Pnode(i) = (1+L)^((i-1)^2/N^2)-1;
    end
    for i = 1:N
        h = (Pnode(i+1)-Pnode(i))/p;
        Pb((i-1)*p+1:i*p) = Pnode(i):h:Pnode(i+1)-h;
    end
    Pb(N*p+1) = L;


    %% indices 
    Tb = zeros(p+1,N);
    for i = 1:N
        Tb(1:2,i) = [p*(i-1)+1 p*i+1]';
        if p > 1
            Tb(3:end,i) = [p*(i-1)+2:p*i]' ;
        end
    end

end
