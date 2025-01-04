function VH = generate_Hartree(Z,L,P,T,bas_val,bas_grad,gp_all,gp_jxw,density)

A = assemble_matrix_1dVH(gp_all, gp_jxw,P, T, bas_val, bas_grad);
b = assemble_rhs_1dVH(bas_val,gp_jxw,density,P,T);
[A,b] = boundary_processVH(A,b,L,Z);

%[solu1,~]    = Bicgstab_1u(A, b, zeros(length(b),1),3000);
%[solu1,~]    = Bicgstab_cho(A, b, zeros(length(b),1),3000);
%[solu1,~]    = Bicgstab_nopre(A, b, zeros(length(b),1),10000);
%[solu1,~]    = Bicgstab_SSOR(A, b, zeros(length(b),1),10000);

% D = diag(diag(A));
% setup.droptol = 1.0e-7;
%[L,U] = ilu(A,setup);
%k = ichol(A);
% [solu1, ~, ~, ~, resvec_diag] = bicgstab(D\A, D\b, 1e-10, 10000, [], [], zeros(length(b), 1));
%[solu1, ~, ~, ~, resvec_ilu] = bicgstab(A,b,1.0e-7,5000,L,U,zeros(length(b), 1));
%  [solu1, ~, ~, ~, resvec_chol] = bicgstab(A, b, 1e-7, 1000, k,k', zeros(length(b), 1));
%  [solu1, ~, ~, ~, resvec_ilu] = bicgstab(A, b, 1e-10, 50000, L,L', zeros(length(b), 1));
%  [solu1, ~, ~, ~, resvec_no_precond] = bicgstab(A, b, 1e-10, 50000, [], [], zeros(length(b), 1));
solu1=A\b;
% [solu1,~]    = Bicgstab_1u(A, b, zeros(length(b),1),3000);

tol=1e-10; maxit=3000;
setup = struct('type','ilutp','droptol',1e-3);
% [L,U] = ilu(A,setup);
% [x,fl0,rr0,it0,rv0] = bicg(A,b,tol,maxit);
% [x,fl2,rr2,it2,rv2] = bicg(A,b,tol,maxit,diag(diag(A)));
% [solu1,fl1,rr1,it1,rv1] = bicg(A,b,tol,maxit,L,U);
% flg=figure(333);
% semilogy(0:length(rv0)-1,rv0/norm(b),'-')
% hold on
% semilogy(0:length(rv1)-1,rv1/norm(b),'-')
% hold on
% semilogy(0:length(rv2)-1,rv2/norm(b),'-')
% yline(tol,'r--');
% legend('No preconditioner','ILU preconditioner','Diagonal preconditioner','Tolerance','Location','East');
% xlabel('Iteration number','fontsize',14);
% ylabel('Relative residual','fontsize',14);
% set(gca,'FontSize',14); 
% 
% clf(flg);
gauss_type = size(gp_all,2);

VH=get_Hartree_at_QPoints(solu1 ,T,gauss_type,bas_val);

% [solu1,res] = conjgradpre(A, b, ones(length(b),1),10000); 
%k = ichol(A);
% D = diag(diag(A));
% omega=0.3;
% L1 = tril(A,-1);
% U1 = triu(A,1);
% M1 = (D + omega * L1) ;
% M2 = (D + omega * U1);
% 
%  [L,U] = ilu(A);


%  [L, U] = incompleteLU(A);
%  k =  incompleteCholesky(A);

%  tic;
% [solu1, ~, ~, ~, res_no] = bicgstab(A, b, 1e-10, 3000, [], [], ones(length(b), 1));
% [solu1, ~, ~, ~, res_ssor] = bicgstab(A, b, 1e-10, 3000, M1, [], zeros(length(b), 1)); 
% [solu1, ~, ~, ~, res_dig] = bicgstab(A, b, 1e-10, 3000, D , [], zeros(length(b), 1));
% [solu1, ~, ~, ~, res_cho] = bicgstab(A, b, 1e-10, 3000, k,k', zeros(length(b), 1));
% [solu1, ~, ~, ~, res_ILU] = bicgstab(A, b, 1e-10, 3000, L,U, zeros(length(b), 1));

%[solu1,res_n] = conjgrad3nopre(A, b, zeros(length(b),1),6000);
% [solu1,res_dig] = conjgradpredig(A, b, ones(length(b),1),6000);
% [solu1,res_ssor] = conjgradpressor(A, b, ones(length(b),1),3000);
% [solu1,res_cho] = conjgradprecho(A, b, ones(length(b),1),3000);
%  [solu1,res_ILU] = conjgradpre1(A, b, ones(length(b),1),3000);

% [solu1,res_no] = Bicgstab_nopre(A, b, zeros(length(b),1),30000);
%  [solu1,res_dig] = Bicgstab_dig(A, b, zeros(length(b),1),30000);
% % %[solu1,res_cho] = Bicgstab_cho(A, b,zeros(length(b),1),3000);
% [solu1, res_ssor]   = Bicgstab_SSOR(A,b, zeros(length(b),1),30000);
%[solu1,res]    = Bicgstab_1u(A, b, zeros(length(b),1),3000);


%[solu1,res] = Bicgstab_nopre(A, b, zeros(length(b),1),30000);
%  [solu1,res] = Bicgstab_dig(A, b, zeros(length(b),1),30000);
% % %[solu1,res] = Bicgstab_cho(A, b,zeros(length(b),1),3000);
% [solu1, res]   = Bicgstab_SSOR(A,b, zeros(length(b),1),30000);
% [solu1,res]    = Bicgstab_1u(A, b, zeros(length(b),1),3000);

%solu1 = A\b;
%toc;
%semilogy(1:length(res_n),res_n, '-k','DisplayName','None','LineWidth', 2);


%  semilogy(1:length(res_no),res_no, '-k','DisplayName','None','LineWidth', 2);hold on;
%  semilogy(1:length(res_dig),res_dig, '-','DisplayName','Diagonal','LineWidth', 2);
%  semilogy(1:length(res_ssor),res_ssor, '-m','DisplayName','ssor','LineWidth', 2);hold off;
% %semilogy(1:length(res_cho),res_cho, '-o','DisplayName','Incomplete Cholesky','LineWidth', 2);
% semilogy(1:length(res_ILU),res_ILU, '-x','DisplayName','Incomplete LU','LineWidth', 2);
  
%  plot((1:length(res_no)),log10(res_no), '-b','DisplayName','None','LineWidth',1);hold on;
% plot((1:length(res_dig)),log10(res_dig), '-g','DisplayName','Diagonal','LineWidth', 1);
%  plot((1:length(res_ssor)),log10(res_ssor), '-r','DisplayName','Ssor','LineWidth', 1);
%  plot((1:length(res_cho)),log10(res_cho), '-x','DisplayName','Incomplete Cholesky','LineWidth',1);hold off;
%  plot((1:length(res_ILU)),log10(res_ILU), '-o','DisplayName','Incomplete LU','LineWidth', 3);
 
 
 
%  figure;
%  a=linspace(1, j, j);%AMG
%  semilogy(resvec_diag, '-y','DisplayName','Diagonal'); hold on;
%  semilogy(resvec_chol, 'c','DisplayName','Incomplete Cholesky');
%  semilogy(res_LU, '-b','DisplayName','Incomplete LU');
%  semilogy(resvec_no_precond, 'm','DisplayName','None');
%  semilogy(1:length(res),res, '--x','DisplayName','AMG');hold off;






%  xlabel('Number of iterations');
%  ylabel('Relative residual norm ');
%  title('512');
%  legend('show');
%  grid on;

% gauss_type = basis_type-100+1;
% 
% VH=V_hartree(solu1 ,num_of_element,gauss_type,basis_type);


end
