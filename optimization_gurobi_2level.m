function result = optimization_gurobi_2level( A , Aeq , f_obj , b , beq, num_params_binary, idx_no_limit)
    %%% Gurobi Optimizer %%%
    clear model ;
    model.A = sparse( [ A ; Aeq ] ) ;
    model.obj = f_obj ;
    model.rhs = full([ b ; beq ]) ;
    model.sense = [ repmat( '<' , size( A , 1 ) , 1 ) ;  repmat( '=' , size( Aeq , 1 ) , 1 ) ] ;


    % if size(A,2) ~= size(Aeq,2)
    %     disp('A , Aeq size error');
    %     quit;
    % end

    num_params = size(A,2);
    num_params_cont = num_params - num_params_binary;

    for r = 1 : num_params_cont
        model.vtype( r ) = 'C' ;
    end

    for r = num_params_cont + 1 : num_params
       model.vtype( r ) = 'B';
    end

    % for r = 1 : num_params
    %    model.vtype( r ) = 'C' ;
    % end


    lb = zeros(num_params , 1 ) ;
    lb(idx_no_limit) = -Inf*ones(size(idx_no_limit,1),1);
    ub = Inf * ones( num_params , 1 ) ;


    model.lb = lb ;
    model.ub = ub ;
    model.modelsense = 'max' ;


    params.outputflag = 0 ;
    params.MipGap = 1e-9 ;
    params.FeasibilityTol = 1e-9 ;
    params.OptimalityTol = 1e-9 ;

    result = gurobi( model, params ) ;
end