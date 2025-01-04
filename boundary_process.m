function A = boundary_process(A)
tmp      = A(1,1);
A(1,:)   = 0;
A(:,1)   = 0;
A(1,1)   = tmp;
tmp = A(end,end);
A(end,:) = 0;
A(:,end) = 0;
A(end,end) = tmp;

% tmp      = M(1,1);
% M(1,:)   = 0;
% M(:,1)   = 0;
% M(1,1)   = tmp;
% tmp = M(end,end);
% M(end,:) = 0;
% M(:,end) = 0;
% M(end,end) = tmp;
end