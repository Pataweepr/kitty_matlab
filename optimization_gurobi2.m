function result = optimization_gurobi( A , Aeq , f_obj , b , beq )

    %%% Gurobi Optimizer %%%
    clear model ;
    model.A = sparse( [ A ; Aeq ] ) ;
    model.obj = f_obj ;
    model.rhs = [ b ; beq ] ;
    model.sense = [ repmat( '<' , size( A , 1 ) , 1 ) ;  repmat( '=' , size( Aeq , 1 ) , 1 ) ] ;



    for r = 1 : 101
        model.vtype( r ) = 'C' ;
    end


    
    lb = zeros( 101 , 1 ) ;
    lb( 101 , 1 ) = -Inf ;
    ub = Inf * ones( 101 , 1 ) ;


    model.lb = lb ;
    model.ub = ub ;
    model.modelsense = 'max' ;


    params.outputflag = 0 ;
    params.MipGap = 1e-9 ;
    params.FeasibilityTol = 1e-9 ;
    params.OptimalityTol = 1e-9 ;

    result = gurobi( model, params ) ;
end