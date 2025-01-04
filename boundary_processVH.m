function [A,b] = boundary_processVH(A,b,R,Z)
% neumann boundary condition for left 0
% right part is Z/r
%A(1,:) = 0;
xend  = Z/R;
b = b-A(:,end)*xend;
tmp = A(end,end);
b(end) = xend*tmp;
A(end,:) = 0;
A(:,end) = 0;
A(end,end) = tmp;
end