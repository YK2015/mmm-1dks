function [P_new,gp_all,gp_jxw,density,mValue,evec] = moving_mesh(P,T,u_h,focc)
 

    % the derivative of function
    alpha =  0.01; % paramter alpha
    
    % basis derivative at middle points on reference element
    basis_type = size(T,1)+100-1;
    n_basis = basis_type-100+1;
    
    %N  = size(P,2)-2; % number inner mesh grids
    n_interval = size(T,2);
    N = n_interval - 1; % number inner mesh vertices
    mValue = zeros(n_interval,1); % N+1 means the number of intervals
    rhs = zeros(N+2,1);
    rhs(1) = P(1); rhs(end) = P(end);
    P_new = P;
    nodes = P(T(1,:));
    Xnew = nodes;
    Xold = Xnew;
    maxStep = 50;
    bas_grad_val = zeros(1,n_basis);
    % bas_grad_val = zeros(n_interval,n_basis);
    for step = 1:maxStep    
        % evaluate the monitor function; only need to move the vertices
        tmp_b = zeros(n_interval,1);
        for i = 1:n_interval
            a = (P_new(T(1,i))+P_new(T(2,i)))/2;
            e_idx = find(nodes<a,1,'last'); % calculate the interval a belongs to in P
            vertices = P(T(1:2,e_idx)); 
            b = 2*(a-vertices(1))/(vertices(2)-vertices(1))-1;
            for j = 1:n_basis
                bas_grad_val(j) = Lagrange_basis_function(b,n_basis-1,j,1);
            end
            u_h_x = bas_grad_val*u_h(T(:,e_idx),:)*2/(vertices(2)-vertices(1));
            mValue(i) = sqrt(alpha+sum(u_h_x.^2));
            tmp_b(i) = b;
        end
        
        hall = P_new(T(2,:))- P_new(T(1,:));
        t1 = mValue'.*hall;
  %      fprintf('Average %.8f\tSTD %.8f\t',mean(t1),std(t1));
        % smooth
        n_smooth = 4; % too small, moving mesh converge slow; too large, high order fails
                       
 
        for k = 1:n_smooth
            tmp = mValue;
            mValue(1) = (2*tmp(1)+tmp(2))/3;
            for i = 2:n_interval-1
                mValue(i) = (tmp(i-1)+2*tmp(i)+tmp(i+1))/4;
            end
            mValue(end) = (2*tmp(end) + tmp(end-1))/3;
        end
        
        P_new_0 = P_new; 
        Xold = Xnew;

        % Define the values for the sub-diagonal, main diagonal, and super-diagonal
        sub_diag = -[mValue(1:N);0;0];  % Sub-diagonal values
        main_diag= [1;mValue(1:N)+mValue(2:N+1);1];
        sup_diag = -[0;0;mValue(2:N+1)];
        A = spdiags([sub_diag,main_diag,sup_diag],[-1,0,1],N+2,N+2);
        Xnew = A\rhs;
        %Xnew = 0.382*Xnew + 0.618*Xold;
        for i = 1:n_interval
            h = (Xnew(i+1)-Xnew(i))/(n_basis-1);
            for j = 1:n_basis-1
                P_new((n_basis-1)*(i-1)+j) = Xnew(i)+(j-1)*h;
            end
        end
        P_new(1)   = P(1);
        P_new(end) = Xnew(end);

        diff_x= norm(P_new-P_new_0,2);

        %fprintf('Step %d\tx_diff = %.8f\n',step,diff_x);
        if(diff_x < 1.0e-5 || step == maxStep) 
            fprintf('Step %d\tx_diff = %.11f\n',step,diff_x);
            break;
        end    
%       4 5 na k ar
        %pause(0.5);
    end

    % update density 
    gauss_type = basis_type-100+1;
    [gp_all, gp_jxw] = update_gauss_info(P_new,T,gauss_type);
    density = zeros(N+1,gauss_type);
    bas_val = zeros(1,n_basis);
    n_orbital = size(u_h,2);
    for i = 1:N+1
        gp_local = gp_all(i,:);
        for j = 1:gauss_type
            a = gp_local(j);
            e_idx = find(nodes<a,1,'last');
            vertices = P(T(1:2,e_idx)); 
            b = 2*(a-vertices(1))/(vertices(2)-vertices(1))-1;
            for k = 1:n_basis
                bas_val(k) = Lagrange_basis_function(b,n_basis-1,k,0);
            end
            u_val = bas_val*u_h(T(:,e_idx),:);
            for l = 1:n_orbital
                density(i,j) = density(i,j) + focc(l)*1/(4*pi)*(u_val(l)^2/a^2); 
            end 
        end
    end

    % update wavefunction
    for i = 1:length(P_new)
        a = P_new(i);
        e_idx = find(nodes<=a,1,'last');
        vertices = P(T(1:2,e_idx)); 
        b = 2*(a-vertices(1))/(vertices(2)-vertices(1))-1;
        for k = 1:n_basis
            bas_val(k) = Lagrange_basis_function(b,n_basis-1,k,0);
        end
        evec(i,:) = bas_val*u_h(T(:,e_idx),:);
    end

   
end