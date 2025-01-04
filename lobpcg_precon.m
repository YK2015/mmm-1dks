function y = lobpcg_precon(x,evalue)
%  Author: Yang Kuang
%  mail  : ykuang@gdut.edu.cn
%  Created Time: 2022-10-09
%  
%  Usage :
%       if evalue > 0: do nonthing
%       if evalue < 0:  (S-eval*M)^(-1) x = y
%       
%  Input :
%           stiff_mat is 0.5 stiff matrix, the kinetic part
%           mass_mat  is the mass matrix
%  
%  Output:
%  

global M;
global stiff_mat;


%y = amg(preconT,x);
[n,blockSize] = size(x);
y = zeros(n,blockSize,'like',x);
for l = 1:blockSize
    if evalue(l) < 0
        y(:,l) = (stiff_mat-evalue(l)*M)\x(:,l);
        %y(:,l)  = bicg(stiff_mat-evalue(l)*M,x(:,l),1.0e-3,10); % 4900 4880
    else
        y(:,l) = x(:,l);
    end
end