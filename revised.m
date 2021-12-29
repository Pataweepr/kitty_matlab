% 2020.03.25
clear ;
clc ;
close all ;


 % Target problem:   
        % Two microgrids
            % twentyfive producers and twentyfive consumers in microgrid #1
            % twentyfive producers and twentyfive consumers in microgrid #2
        
        % The microgrids are connected through a line with finite capacities.
        
        % Procucers generate and sell the electricity
        
        % Consumers buy the electricity and consume them.
        


%% Parameter settings  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
% Parameters of line
    % Line susceptance Bline ;
Bline = 100 ;
    % Line limit Sline = 30
Sline = 30 ;

% Parameters of players
    % load parameters from excel file
Data = xlsread( 'parameters4' ) ;

Data = sortrows(Data,[5 4]);

c = Data( : , 2 )' ;
Num_decision_variables = size( c , 2 )  + 1 ;
Num_inequality_constraints = Num_decision_variables + 1 ;
Num_equality_constraints = Num_decision_variables + 2 ;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                

% col2--> c 
% col3--> b_i
% col4--> pro or con (0 or 1)
% col5--> nord con (1 or 2)


%% Calculation of matrices and vectors %%%%%%%%%%%%%%%%%%%%%%%%

    % a vecotr of coefficients of the objective function
f_obj = zeros( 1 , Num_decision_variables ) ;
for i = 1 : size( c , 2 )
    f_obj( 1 , i ) = c( 1, i ) ;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    % a matrix of coefficients of inequalities
A = zeros( Num_inequality_constraints , Num_decision_variables ) ;
for i = 1 : size( c , 2 )
    A( i , i ) = 1 ;
end
for i = 1 : size( c , 2 )
        % producers connected to node #1
    if ( Data( i , 4 ) == 0 ) && ( Data( i , 5 ) == 1 )
        A( 101 , i ) = 1 ;
        % producers connected to node #2
    elseif ( Data( i , 4 ) == 0 ) && ( Data( i , 5 ) == 2 )
        A( 102 , i ) = 1 ;
        % consumers connected to node #1
    elseif ( Data( i , 4 ) == 1 ) && ( Data( i , 5 ) == 1 )
        A( 101 , i ) = - 1 ;
        % consumers connected to node #2
    elseif ( Data( i , 4 ) == 1 ) && ( Data( i , 5 ) == 2 )
        A( 102 , i ) = - 1 ;
    end
end

A( 101 , size( c , 2 ) + 1 ) = -1 ;
A( 102 , size( c , 2 ) + 1 ) = 1 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                 
    % a vector of resource capacities
b = zeros( size( A , 1 ) , 1 ) ;
b( 1 : size( c , 2 ) , 1 ) = Data( : , 3 ) ;

    % a vector of line capacities
b( size( c , 2 ) + 1 , 1 ) = Sline/Bline ;
b( size( c , 2 ) + 2 , 1 ) = Sline/Bline ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % a matrix and vector of power balance
Aeq = zeros( 2 , Num_decision_variables ) ;
beq = zeros( 2 , 1 ) ;

for i = 1 : size( c , 2 )
        % producers connected to node #1
    if ( Data( i , 4 ) == 0 ) && ( Data( i , 5 ) == 1 )
        Aeq( 1 , i ) = 1 ;
        % producers connected to node #2
    elseif ( Data( i , 4 ) == 0 ) && ( Data( i , 5 ) == 2 )
        Aeq( 2 , i ) = 1 ;
        % consumers connected to node #1
    elseif ( Data( i , 4 ) == 1 ) && ( Data( i , 5 ) == 1 )
        Aeq( 1 , i ) = - 1 ;
        % consumers connected to node #2
    elseif ( Data( i , 4 ) == 1 ) && ( Data( i , 5 ) == 2 )
        Aeq( 2 , i ) = - 1 ;
    end
end

Aeq( 1 , size( c , 2 ) + 1 ) = Bline ;
Aeq( 2 , size( c , 2 ) + 1 ) = -Bline ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







    % Optimization by Gurobi optimizer
result = optimization_gurobi2( A , Aeq , f_obj , b , beq ) ;


fprintf( '<Optimization result>\n\n' ) ;


% Decision variables
theta = result.x( 101 , 1 ) ;
P12 = - Bline * theta ;

% for i = 1 : size( c , 2 )/2
%     fprintf( 'Player #%d (producer) generates %.2f and sells it\n' , i ,  result.x( i , 1 ) ) ;
% end
% 
% for i = size( c , 2 ) / 2 + 1 : size( c , 2 )
%     fprintf( 'Player #%d (consumer) buys %.2f and sells it\n' , i ,  result.x( i , 1 ) ) ;
% end

fprintf( 'Power flows %.2f from microgrid #1 to #2\n\n' , P12 ) ;


    % electric power %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Energy_cleared = zeros( 100 , 1 ) ;
 for i = 1 : size( c , 2 )
        % producers
    if ( Data( i , 4 ) == 0 )
        Energy_cleared( i , 1 ) = result.x( i , 1 ) * ( + 1 ) ;
        % consumers
    elseif ( Data( i , 4 ) == 1 )
        Energy_cleared( i , 1 ) = result.x( i , 1 ) * ( - 1 ) ;
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % shadow price %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i = 1 : size( c , 2 )/2
%     fprintf( 'The shadow price of resource possessed by player #%d (producer) is %.2f\n' , i ,  result.pi( i , 1 ) ) ;
% end
% 
% for i = size( c , 2 ) / 2 + 1 : size( c , 2 )
%     fprintf( 'The shadow price of resource possessed by player #%d (consumer) is %.2f\n' , i ,  result.pi( i , 1 ) ) ;
% end

yline1 = result.pi( 101 , 1 ) ;
yline2 = result.pi( 102 , 1 ) ;
if yline1 > 0
    fprintf( 'The shadow price of line capacity is %.2f\n\n' , yline1 ) ;
else
    fprintf( 'The shadow price of line capacity is %.2f\n\n' , yline2 ) ;
end

    % figure
subplot( 3 , 1 , 2 ) ;
g = bar( [ 1 : 1 : 100 ] , result.pi( 1 : 100 , 1 ) , 'stacked' ) ;
set( g , 'FaceColor' , [0.3 0.3 0.3] ) ;
xlabel( 'Player' , 'FontSize' , labelsize ) ;
ylabel( 'Shadow price [JPY/kWh]' , 'FontSize' , labelsize ) ;
ylim( [ 0 , 20 ] ) ;
xlim( [ -1 , 101 ] ) ;
% xtickformat('%.3f') ;
set( gca ,'YTick' , 0 : 2 : 20 ) ;
set( gca , 'FontName' , 'Times' , 'FontSize' , fontsize ) ;
grid on ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% imputation in the core %%%%%%%%%%%%%%%%%%%%%
u = zeros( Num_decision_variables , 1 ) ;
for i = 1 : Num_decision_variables
    u( i , 1 ) = result.pi( i , 1 ) * b( i , 1 ) ;
end
uline = yline1 * Sline/Bline + yline2 * Sline/Bline ;


% for i = 1 : size( c , 2 )/2
%     fprintf( 'The imputation of player #%d (producer) is %.4f\n' , i ,  u( i , 1 ) ) ;
% end
% 
% for i = size( c , 2 ) / 2 + 1 : size( c , 2 )
%     fprintf( 'The imputation of player #%d (consumer) is %.4f\n' , i ,  u( i , 1 ) ) ;
% end
       
fprintf( 'These results show that the producers who wish to sell the electricity with expensive price obtain few profits and the consumers who with to purchase the electricity with expensive price obtain large profits\n' ) ;
fprintf( 'Therefore, producers have incentives to sell electricity at a lower price, and consumers have incentives to purchase electricity at a higher price. This would be good for social.\n\n' ) ;

fprintf( 'The imputation of the line possessed by the power system operator is %.4f\n' , uline ) ;

% u1+u2+?c?v+u100+uline
objval = 0 ;
for i = 1 : Num_decision_variables
    objval = objval + u( i , 1 ) ;
end
objval = objval + uline ;

if result.objval == objval
    fprintf( 'The profit obtained by the cooperation is allocated to the players and the power system operator \n' )
    fprintf( 'The total group rationality is satisfied\n' ) ; 
end

    % figure
subplot( 3 , 1 , 3 ) ;
g = bar( [ 1 : 1 : 101 ] , u( : , 1 ) , 'stacked' ) ;
set( g , 'FaceColor' , [0.3 0.3 0.3] ) ;
xlabel( 'Player' , 'FontSize' , labelsize ) ;
ylabel( 'Imputation [JPY]' , 'FontSize' , labelsize ) ;
ylim( [ 0 , 2000 ] ) ;
xlim( [ -1 , 101 ] ) ;
% xtickformat('%.3f') ;
set( gca ,'YTick' , 0 : 200 : 2000 ) ;
set( gca , 'FontName' , 'Times' , 'FontSize' , fontsize ) ;
grid on ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%