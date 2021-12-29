clear ;
clc ;
close all ;

data = xlsread( 'parameters4' ) ;

% data =[1,-10, 100, 0, 1;
%         2,-20, 120, 0, 2;
%         51,15, 70, 1, 1;
%         52,25, 80, 1, 2];



% ! sort data
data = sortrows(data,[5 4]);

% col2--> c 
% col3--> b_i
% col4--> pro or con (0 or 1)
% col5--> nord con (1 or 2)


B_line = 100 ;
% * Line limit Sline = 30
S_line = 30 ;
tol_node = 2;

pro_or_con = data(:,4);
nord_idx = data(:,5);

if mod(size(data,1),2*tol_node) ~= 0 %
    disp('size data error')
    quit;
end

% ! num conti
% size(x) == size(data,1)
% size(b_add) == size(data,1)
% size(theta2) == 1
% size(mu) == tol_node
% size(beta_i) == size(data,1)
% size(lamda) == size(data,1)
% size(y_line) == 2

% ! num binary
% size(u_labmdat) == size(data,1)
% size(u_beta) == size(data,1)
% size(u_yline) == size(y_line,1)

x_size = size(data,1);
num_params_con = 4*x_size + tol_node + 1 + 2 ;
num_params_binary = 2*x_size + 2 ;


% ! comment for fix bug
% c_read = data(:,2)  ;
% b_read = data(:,3) ;

c = data(:,2)';
b = data(:,3)';


big_M = 1000;

% % ! edit c_read,b_read to c,b (c,b is row vector) 
% c_prod = zeros(x_size / (2*tol_node) ,tol_node) ;
% c_con = zeros(x_size / (2*tol_node) ,tol_node) ;
% b_prod = zeros(x_size / (2*tol_node),tol_node) ;
% b_con = zeros(x_size / (2*tol_node),tol_node) ;

% quit
% pro_or_con = data(:,4);
% nord_idx = data(:,5);
% for idx = 1 : tol_node
%     c_prod(:,idx) = c_read(pro_or_con == 0 & nord_idx == idx);
%     b_prod(:,idx) = b_read(pro_or_con == 0 & nord_idx == idx);

%     c_con(:,idx) = c_read(pro_or_con == 1 & nord_idx == idx);
%     b_con(:,idx) = b_read(pro_or_con == 1 & nord_idx == idx);
% end
% * c, b col vector
% c = [c_prod;c_con];
% b = [b_prod;b_con];

% c = reshape(c,[size(c,1)*size(c,2),1]);
% b = reshape(b,[size(b,1)*size(b,2),1]);

% c = [reshape(c_prod,[size(c_prod,1) * size(c_prod,2),1]);
%     reshape(c_con,[size(c_con,1) * size(c_con,2),1])];

% b = [reshape(b_prod,[size(b_prod,1) * size(b_prod,2),1]);
%     reshape(b_con,[size(b_con,1) * size(b_con,2),1])];

% clear c_prod, clear c_con;
% clear b_prod, clear b_con;

% % * c, b col vector
% c = transpose(c);
% b = transpose(b);



% ! var sort 
% * x, b_add, theta2,
% * mu_1, mu_2 , 
% * beta, lambda, 
% * yline1, yline2, 
% * u_lambda, u_beta, u_yline1, u_yline2

num_groups = 2*tol_node;
f_obj = [-c , zeros(1, num_params_con + num_params_binary - x_size)];

theta2_idx = 2*x_size+1;
mu_idx = theta2_idx+1:theta2_idx+tol_node;
idx_no_limit = [theta2_idx, mu_idx]';
% ! eq con st
% µ1(Bline) − µ2(Bline) − yline1 + yline2 = 0
Aeq_1 = [zeros(1,2*x_size + 1) , [B_line, -B_line], ...
        zeros(1,2*x_size), [-1 ,1] , ...
        zeros(1,2*x_size + 2)];
        
% Aeq_1 = sparse(Aeq_1);
beq_1 = 0 ;

% −c1 + µ1 + λ1 − β1 = 0 (4.28)
% −c2 − µ1 + λ2 − β2 = 0 (4.29)
% −c3 + µ2 + λ3 − β3 = 0 (4.30)
% −c4 − µ2 + λ4 − β4 = 0
% * x, b_add, theta2,
% * mu_1, mu_2 , 
% * beta, lambda, 
% * yline1, yline2, 
% * u_lambda, u_beta, u_yline1, u_yline2
Aeq_2 = [zeros(x_size,2*x_size+1 ), ...
        kron(eye(tol_node),[ones(x_size/num_groups,1) ; -ones(x_size/num_groups,1)]), ...
        -eye(x_size), eye(x_size), ...
        zeros(x_size,  2 + 2*x_size + 2)] ;
% Aeq_2 = sparse(Aeq_2);
beq_2 = c';

% x1 − x2 + Blineθ2 = 0 (4.42)
% x3 − x4 − Blineθ2 = 0
Aeq_3 = [ kron(eye(tol_node),[ones(1,x_size/num_groups) , -ones(1,x_size/num_groups)]), ...
        zeros(tol_node, x_size), [B_line;-B_line], ...
        zeros(tol_node, tol_node + 4*x_size + 2 + 2)] ;
% Aeq_3 = sparse(Aeq_3);
beq_3 = zeros(tol_node,1);


A_eq_b_add = [zeros(x_size,x_size),...
            eye(x_size),...
            zeros(x_size, 1 + tol_node + x_size + x_size + 2 + x_size + x_size + 2)
            ];
b_eq_b_add = zeros(x_size,1);
% disp(['size(Aeq_1)', num2str(size(Aeq_1)), 'size(beq_1)', num2str(size(beq_1))]);
% disp(['size(Aeq_2)', num2str(size(Aeq_2)), 'size(beq_2)', num2str(size(beq_2))]);
% disp(['size(Aeq_3)', num2str(size(Aeq_3)), 'size(beq_3)', num2str(size(beq_3))]);


Aeq = sparse([Aeq_1; Aeq_2; Aeq_3]);
beq = [beq_1; beq_2; beq_3];

% Aeq = sparse([Aeq_1; Aeq_2; Aeq_3; A_eq_b_add]);
% beq = [beq_1; beq_2; beq_3; b_eq_b_add];

% clear Aeq_1;
% clear Aeq_2;
% clear Aeq_3;

% clear beq_1;
% clear beq_2;
% clear beq_3;

% ! in-eq con st

% * b_add ≥ 0
A_ineq_1 = [ zeros(x_size,x_size), ...
            -eye(x_size), ...
            zeros(x_size, tol_node + 4*x_size + 1 + 2 + 2 )] ;
b_ineq_1 = zeros(x_size,1);

% 0 ≤ λ ≤ M*u_λ -- >  -λ ≤ 0 , λ - M*u_λ≤ 0

% * -λ ≤ 0
A_ineq_2 = [ zeros(x_size,x_size + x_size + 1 + tol_node + x_size),...
            -eye(x_size), ...
            zeros(x_size, 2 + x_size + x_size + 2)] ;
b_ineq_2 = zeros(x_size,1);

% * λ - M*u_λ≤ 0
A_ineq_3 = [ zeros(x_size,x_size + x_size + 1 + tol_node + x_size), ...
            eye(x_size), ...
            zeros(x_size,2), ...
            -big_M*eye(x_size), ...
            zeros(x_size, x_size + 2)] ;
b_ineq_3 = zeros(x_size,1);

% 0 ≤ −x + (b + b_add) ≤ M(1 − u_λ) --> −x - b_add ≤ b , −x + b_add + M*u_λ   ≤ M-b

% * x - b_add ≤ b
A_ineq_4 = [ eye(x_size), -eye(x_size), ...
            zeros(x_size,1 + tol_node + x_size + x_size + 2 + x_size + x_size + 2)] ;
b_ineq_4 = b';

% * −x + b_add + M*u_λ   ≤ M-b
A_ineq_5 = [ -eye(x_size), eye(x_size), ...
            zeros(x_size, 1 + tol_node + x_size + x_size + 2), ...
            big_M*eye(x_size), ...
            zeros(x_size, x_size + 2)] ;
b_ineq_5 = big_M*ones(x_size,1) - b';

% 0 ≤ β ≤ M*uβ  -->  - β ≤ 0 , β - M*uβ ≤ 0
% * - β ≤ 0 
A_ineq_6 = [zeros(x_size, x_size + x_size + 1 + tol_node), ...
            -eye(x_size), ...
            zeros(x_size, x_size + 2 + x_size + x_size + 2)] ;
b_ineq_6 = zeros(x_size,1);

% * β - M*uβ ≤ 0
A_ineq_7 = [zeros(x_size, x_size + x_size + 1 + tol_node), ...
            eye(x_size), ...
            zeros(x_size, x_size + 2 + x_size ), ...
            -big_M*eye(x_size), ...
            zeros(x_size, 2) ] ;
b_ineq_7 = zeros(x_size,1);

% 0 ≤ x ≤ M(1 − uβ ) --> -x ≤ 0, x + M*uβ  ≤ M 
% * -x ≤ 0,
A_ineq_8 = [-eye(x_size), ...
            zeros(x_size, x_size + 1 + tol_node + x_size + x_size + 2 + x_size + x_size + 2)] ;
b_ineq_8 = zeros(x_size,1);

% * x + M*uβ  ≤ M 
A_ineq_9 = [eye(x_size), ...
            zeros(x_size,x_size + 1 + tol_node + x_size + x_size + 2 + x_size), ...
            big_M*eye(x_size), ...
            zeros(x_size, 2)] ;
b_ineq_9 = big_M*ones(x_size,1);



% * x, b_add, theta2,
% * mu_1, mu_2 , 
% * beta, lambda, 
% * yline1, yline2, 
% * u_lambda, u_beta, u_yline1, u_yline2

% * 0 ≤ yline1 ≤ M*uyline1 
% * 0 ≤ yline2 ≤ M*uyline2 
A_ineq_10 = [zeros(1,x_size + x_size + 1 + tol_node + x_size + x_size),...
            [-1,0], zeros(1,x_size + x_size + 2)];
b_ineq_10 = 0;

A_ineq_11 = [zeros(1,x_size + x_size + 1 + tol_node + x_size + x_size),...
            [0,-1], zeros(1,x_size + x_size + 2)];
b_ineq_11 = 0;

A_ineq_12 = [zeros(1,x_size + x_size + 1 + tol_node + x_size + x_size),...
            [1,0], zeros(1,x_size + x_size),...
            [-big_M, 0]];
b_ineq_12 = 0;

A_ineq_13 = [zeros(1,x_size + x_size + 1 + tol_node + x_size + x_size),...
            [0,1], zeros(1,x_size + x_size),...
            [0, -big_M]];
b_ineq_13 = 0;

% * x, b_add, theta2,
% * mu_1, mu_2 , 
% * beta, lambda, 
% * yline1, yline2, 
% * u_lambda, u_beta, u_yline1, u_yline2

% * 0 <= theta2 + (S_line/B_line) <= M(1-u_yline1)
% * 0 <= -theta2 + (S_line/B_line) <= M(1-u_yline2)

A_ineq_14 = [zeros(1,x_size + x_size ), -1, ...
            zeros(1,tol_node + x_size + x_size + 2 + x_size + x_size + 2)];
b_ineq_14 = S_line/B_line;

A_ineq_15 = [zeros(1,x_size + x_size ), 1, ...
            zeros(1,tol_node + x_size + x_size + 2 + x_size + x_size + 2)];
b_ineq_15 = S_line/B_line;

A_ineq_16 = [zeros(1,x_size + x_size ), 1, ...
            zeros(1,tol_node + x_size + x_size + 2 + x_size + x_size),...
            [big_M, 0]];
b_ineq_16 = big_M - (S_line/B_line);

A_ineq_17 = [zeros(1,x_size + x_size ), -1, ...
            zeros(1,tol_node + x_size + x_size + 2 + x_size + x_size),...
            [0, big_M]];
b_ineq_17 = big_M - (S_line/B_line);
% disp(['size(A_ineq_1)', num2str(size(A_ineq_1)), 'size(b_ineq_1)', num2str(size(b_ineq_1))]);
% disp(['size(A_ineq_2)', num2str(size(A_ineq_2)), 'size(b_ineq_2)', num2str(size(b_ineq_2))]);
% disp(['size(A_ineq_3)', num2str(size(A_ineq_3)), 'size(b_ineq_3)', num2str(size(b_ineq_3))]);
% disp(['size(A_ineq_4)', num2str(size(A_ineq_4)), 'size(b_ineq_4)', num2str(size(b_ineq_4))]);
% disp(['size(A_ineq_5)', num2str(size(A_ineq_5)), 'size(b_ineq_5)', num2str(size(b_ineq_5))]);
% disp(['size(A_ineq_6)', num2str(size(A_ineq_6)), 'size(b_ineq_6)', num2str(size(b_ineq_6))]);
% disp(['size(A_ineq_7)', num2str(size(A_ineq_7)), 'size(b_ineq_7)', num2str(size(b_ineq_7))]);
% disp(['size(A_ineq_8)', num2str(size(A_ineq_8)), 'size(b_ineq_8)', num2str(size(b_ineq_8))]);
% disp(['size(A_ineq_9)', num2str(size(A_ineq_9)), 'size(b_ineq_9)', num2str(size(b_ineq_9))]);
% disp(['size(A_ineq_10)', num2str(size(A_ineq_10)), 'size(b_ineq_10)', num2str(size(b_ineq_10))]);
% disp(['size(A_ineq_11)', num2str(size(A_ineq_11)), 'size(b_ineq_11)', num2str(size(b_ineq_11))]);
% disp(['size(A_ineq_12)', num2str(size(A_ineq_12)), 'size(b_ineq_12)', num2str(size(b_ineq_12))]);
% disp(['size(A_ineq_13)', num2str(size(A_ineq_13)), 'size(b_ineq_13)', num2str(size(b_ineq_13))]);

A_ineq = sparse([A_ineq_1; 
                
                A_ineq_2; A_ineq_3;A_ineq_4;
                A_ineq_5;A_ineq_6;A_ineq_7;A_ineq_8;
                A_ineq_9;A_ineq_10;A_ineq_11;A_ineq_12;
                A_ineq_13;
                
                A_ineq_14;A_ineq_15;A_ineq_16;A_ineq_17
                
                % A_ineq_b_add
                ]);

b_ineq = [b_ineq_1; 

            b_ineq_2; b_ineq_3;b_ineq_4;b_ineq_5;
            b_ineq_6;b_ineq_7;b_ineq_8;b_ineq_9;
            b_ineq_10;b_ineq_11;b_ineq_12;b_ineq_13;
            
            b_ineq_14;b_ineq_15;b_ineq_16;b_ineq_17;
            % b_ineq_b_add
            ];

% clear A_ineq_1, clear A_ineq_2, clear A_ineq_3 , clear A_ineq_4;
% clear A_ineq_5, clear A_ineq_6, clear A_ineq_7 , clear A_ineq_8;
% clear A_ineq_9, clear A_ineq_10, clear A_ineq_11 , clear A_ineq_12, clear A_ineq_13 ;

% clear b_ineq_1, clear b_ineq_2, clear b_ineq_3 , clear b_ineq_4;
% clear b_ineq_5, clear b_ineq_6, clear b_ineq_7 , clear b_ineq_8;
% clear b_ineq_9, clear b_ineq_10, clear b_ineq_11 , clear b_ineq_12, clear b_ineq_13 ;
% ? gurobi optimizer

% Aeq = sparse([Aeq_1; Aeq_2; Aeq_3]);
% beq = sparse([beq_1; beq_2; beq_3]);
% f_obj = [-c , zeros(1, num_params_con + num_params_binary - x_size)];

% result = optimization_gurobi_2level( A , Aeq , f_obj , b , beq,
% num_params_binary, theta2_idx);
% * result = optimization_gurobi_2level( A , Aeq , f_obj , b , beq, num_params_binary, theta2_idx)
gurobi_result = optimization_gurobi_2level(A_ineq, Aeq, f_obj, b_ineq, beq, num_params_binary, idx_no_limit);
% function result = optimization_gurobi_2level( A , Aeq , f_obj , b , beq, num_params_binary, theta2_idx)

x_op = gurobi_result.x(1:x_size);
data(:,6) = x_op;
data = sortrows(data,[1]);

Energy_cleared = zeros( x_size , 1 ) ;
for i = 1 : x_size
       % producers
   if ( data( i , 4 ) == 0 )
       Energy_cleared( i , 1 ) = data( i , 6 ) * ( + 1 ) ;
       % consumers
   elseif ( data( i , 4 ) == 1 )
       Energy_cleared( i , 1 ) = data( i , 6 ) * ( - 1 ) ;
   end
end



scrsz = get( groot , 'ScreenSize' ) ;
% Position?�?C?ʒu?C?ʒu?C�??C???�?�?? %
f = figure( 'Position' , [ scrsz(4)/10 scrsz(4)/2 scrsz(3)/1.5 scrsz(4)/1.2 ] ) ;
movegui( f , 'southwest' ) ;
labelsize = 24 ;
fontsize = 24 ;
subplot( 3 , 1 , 1 ) ;
g = bar( [ 1 : 1 : 100 ] , Energy_cleared , 'stacked' ) ;
set( g , 'FaceColor' , [0.3 0.3 0.3] ) ;
xlabel( 'Player' , 'FontSize' , labelsize ) ;
ylabel( 'power [p.u.]' , 'FontSize' , labelsize ) ;
ylim( [ -150 , 150 ] ) ;
xlim( [ -1 , 101 ] ) ;
% xtickformat('%.3f') ;
set( gca ,'YTick' , -150 : 50 : 150 ) ;
set( gca , 'FontName' , 'Times' , 'FontSize' , fontsize ) ;
grid on ;