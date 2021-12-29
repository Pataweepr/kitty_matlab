clear ;
clc ;





    % Target problem:   
        % Two microgrids
            % twentyfive producers and twentyfive consumers in microgrid #1
            % twentyfive producers and twentyfive consumers in microgrid #2
        
        % The microgrids are connected through a line with finite capacities.
        
        % Procucers generate and sell the electricity
        
        % Consumers buy the electricity and consume them.
        

        
        
        
        
    % Model of the problem
        % Producers
            % Player #1:    1 producer in microgrid #1
            % Player #2:    1 producer in microgrid #2
            % Player #3:    2 producer in microgrid #1
            % Player #4:    2 producer in microgrid #2
            % Player #5:    3 producer in microgrid #1
            % Player #6:    3 producer in microgrid #2
            % Player #7:    4 producer in microgrid #1
            % Player #8:    4 producer in microgrid #2
            % Player #9:    5 producer in microgrid #1
            % Player #10:   5 producer in microgrid #2
            % Player #11:   6 producer in microgrid #1
            % Player #12:   6 producer in microgrid #2
            % Player #13:   7 producer in microgrid #1
            % Player #14:   7 producer in microgrid #2
            % Player #15:   8 producer in microgrid #1
            % Player #16:   8 producer in microgrid #2
            % Player #17:   9 producer in microgrid #1
            % Player #18:   9 producer in microgrid #2
            % Player #19:  10 producer in microgrid #1
            % Player #20:  10 producer in microgrid #2
            % Player #21:  11 producer in microgrid #1
            % Player #22:  11 producer in microgrid #2
            % Player #23:  12 producer in microgrid #1
            % Player #24:  12 producer in microgrid #2
            % Player #25:  13 producer in microgrid #1
            % Player #26:  13 producer in microgrid #2
            % Player #27:  14 producer in microgrid #1
            % Player #28:  14 producer in microgrid #2
            % Player #29:  15 producer in microgrid #1
            % Player #30:  15 producer in microgrid #2
            % Player #31:  16 producer in microgrid #1
            % Player #32:  16 producer in microgrid #2
            % Player #33:  17 producer in microgrid #1
            % Player #34:  17 producer in microgrid #2
            % Player #35:  18 producer in microgrid #1
            % Player #36:  18 producer in microgrid #2
            % Player #37:  19 producer in microgrid #1
            % Player #38:  19 producer in microgrid #2
            % Player #39:  20 producer in microgrid #1
            % Player #40:  20 producer in microgrid #2
            % Player #41:  21 producer in microgrid #1
            % Player #42:  21 producer in microgrid #2
            % Player #43:  22 producer in microgrid #1
            % Player #44:  22 producer in microgrid #2
            % Player #45:  23 producer in microgrid #1
            % Player #46:  23 producer in microgrid #2
            % Player #47:  24 producer in microgrid #1
            % Player #48:  24 producer in microgrid #2
            % Player #49:  25 producer in microgrid #1
            % Player #50:  25 producer in microgrid #2
        % Consumers
            % Player #51:   1 consumer in microgrid #1
            % Player #52:   1 consumer in microgrid #2
            % Player #53:   2 consumer in microgrid #1
            % Player #54:   2 consumer in microgrid #2
            % Player #55:   3 consumer in microgrid #1
            % Player #56:   3 consumer in microgrid #2
            % Player #57:   4 consumer in microgrid #1
            % Player #58:   4 consumer in microgrid #2
            % Player #59:   5 consumer in microgrid #1
            % Player #60:   5 consumer in microgrid #2
            % Player #61:   6 consumer in microgrid #1
            % Player #62:   6 consumer in microgrid #2
            % Player #63:   7 consumer in microgrid #1
            % Player #64:   7 consumer in microgrid #2
            % Player #65:   8 consumer in microgrid #1
            % Player #66:   8 consumer in microgrid #2
            % Player #67:   9 consumer in microgrid #1
            % Player #68:   9 consumer in microgrid #2
            % Player #69:  10 consumer in microgrid #1
            % Player #70:  10 consumer in microgrid #2
            % Player #71:  11 consumer in microgrid #1
            % Player #72:  11 consumer in microgrid #2
            % Player #73:  12 consumer in microgrid #1
            % Player #74:  12 consumer in microgrid #2
            % Player #75:  13 consumer in microgrid #1
            % Player #76:  13 consumer in microgrid #2
            % Player #77:  14 consumer in microgrid #1
            % Player #78:  14 consumer in microgrid #2
            % Player #79:  15 consumer in microgrid #1
            % Player #80:  15 consumer in microgrid #2
            % Player #81:  16 consumer in microgrid #1
            % Player #82:  16 consumer in microgrid #2
            % Player #83:  17 consumer in microgrid #1
            % Player #84:  17 consumer in microgrid #2
            % Player #85:  18 consumer in microgrid #1
            % Player #86:  18 consumer in microgrid #2
            % Player #87:  19 consumer in microgrid #1
            % Player #88:  19 consumer in microgrid #2
            % Player #89:  20 consumer in microgrid #1
            % Player #90:  20 consumer in microgrid #2
            % Player #91:  21 consumer in microgrid #1
            % Player #92:  21 consumer in microgrid #2
            % Player #93:  22 consumer in microgrid #1
            % Player #94:  22 consumer in microgrid #2
            % Player #95:  23 consumer in microgrid #1
            % Player #96:  23 consumer in microgrid #2
            % Player #97:  24 consumer in microgrid #1
            % Player #98:  24 consumer in microgrid #2
            % Player #99:  25 consumer in microgrid #1
            % Player #100: 25 consumer in microgrid #2
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %  Player #1 (producer)             -          Player #50 (producer) %
        %     |---------------- [line] -------------------|                %
        %  Player #51 (consumer)                       Player #100 (consumer) %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
        % Parameters of producers
            % Player #1 offers a selling block 100 with 10 JPY/kWh
                b1 = 100 ;      % resource
                c1 = - 10 ;     % price
            % Player #2 offers a selling block 120 with 20 JPY/kWh
                b2 = 120 ;      % resource
                c2 = - 20 ;     % price
            % Player #3 offers a selling block 110 with 15 JPY/kWh
                b3 = 110 ;      % resource
                c3 = - 15 ;     % price
           % Player #4 offers a selling block 100 with 20 JPY/kWh
                b4 = 100 ;      % resource
                c4 = - 20 ;     % price
           % Player #5 offers a selling block 115 with 10 JPY/kWh
                b5 = 115 ;      % resource
                c5 = - 10 ;     % price
           % Player #6 offers a selling block 130 with 20 JPY/kWh
                b6 = 130 ;      % resource
                c6 = - 20 ;     % price
           % Player #7 offers a selling block 110 with 10 JPY/kWh
                b7 = 110 ;      % resource
                c7 = - 10 ;     % price
           % Player #8 offers a selling block 130 with 25 JPY/kWh
                b8 = 130 ;      % resource
                c8 = - 25 ;     % price
           % Player #9 offers a selling block 105 with 20 JPY/kWh
                b9 = 105 ;      % resource
                c9 = - 20 ;     % price
           % Player #10 offers a selling block 100 with 15 JPY/kWh
                b10 = 100 ;      % resource
                c10 = - 15 ;     % price
           % Player #11 offers a selling block 115 with 10 JPY/kWh
                b11 = 115 ;      % resource
                c11 = - 10 ;     % price
           % Player #12 offers a selling block 120 with 20 JPY/kWh
                b12 = 120 ;      % resource
                c12 = - 20 ;     % price
           % Player #13 offers a selling block 110 with 25 JPY/kWh
                b13 = 110 ;      % resource
                c13 = - 25 ;     % price
           % Player #14 offers a selling block 100 with 10 JPY/kWh
                b14 = 100 ;      % resource
                c14 = - 10 ;     % price
           % Player #15 offers a selling block 125 with 25 JPY/kWh
                b15 = 125 ;      % resource
                c15 = - 25 ;     % price
           % Player #16 offers a selling block 115 with 15 JPY/kWh
                b16 = 115 ;      % resource
                c16 = - 15 ;     % price
           % Player #17 offers a selling block 110 with 10 JPY/kWh
                b17 = 110 ;      % resource
                c17 = - 10 ;     % price
           % Player #18 offers a selling block 100 with 25 JPY/kWh
                b18 = 100 ;      % resource
                c18 = - 25 ;     % price
           % Player #19 offers a selling block 115 with 15 JPY/kWh
                b19 = 115 ;      % resource
                c19 = - 15 ;     % price
           % Player #20 offers a selling block 110 with 20 JPY/kWh
                b20 = 110 ;      % resource
                c20 = - 20 ;     % price
           % Player #21 offers a selling block 125 with 25 JPY/kWh
                b21 = 125 ;      % resource
                c21 = - 25 ;     % price
           % Player #22 offers a selling block 135 with 15 JPY/kWh
                b22 = 135 ;      % resource
                c22 = - 15 ;     % price
           % Player #23 offers a selling block 110 with 20 JPY/kWh
                b23 = 110 ;      % resource
                c23 = - 20 ;     % price
           % Player #24 offers a selling block 125 with 35 JPY/kWh
                b24 = 125 ;      % resource
                c24 = - 35 ;     % price
           % Player #25 offers a selling block 115 with 25 JPY/kWh
                b25 = 115 ;      % resource
                c25 = - 25 ;     % price
           % Player #26 offers a selling block 110 with 15 JPY/kWh
                b26 = 110 ;      % resource
                c26 = - 15 ;     % price
           % Player #27 offers a selling block 100 with 15 JPY/kWh
                b27 = 100 ;      % resource
                c27 = - 15 ;     % price
           % Player #28 offers a selling block 125 with 25 JPY/kWh
                b28 = 125 ;      % resource
                c28 = - 25 ;     % price
           % Player #29 offers a selling block 120 with 15 JPY/kWh
                b29 = 120 ;      % resource
                c29 = - 15 ;     % price
           % Player #30 offers a selling block 105 with 10 JPY/kWh
                b30 = 105 ;      % resource
                c30 = - 10 ;     % price
           % Player #31 offers a selling block 130 with 25 JPY/kWh
                b31 = 130 ;      % resource
                c31 = - 25 ;     % price
           % Player #32 offers a selling block 125 with 20 JPY/kWh
                b32 = 125 ;      % resource
                c32 = - 20 ;     % price
           % Player #33 offers a selling block 100 with 20 JPY/kWh
                b33 = 100 ;      % resource
                c33 = - 20 ;     % price
           % Player #34 offers a selling block 105 with 15 JPY/kWh
                b34 = 105 ;      % resource
                c34 = - 15 ;     % price
           % Player #35 offers a selling block 120 with 25 JPY/kWh
                b35 = 120 ;      % resource
                c35 = - 25 ;     % price
           % Player #36 offers a selling block 130 with 35 JPY/kWh
                b36 = 130 ;      % resource
                c36 = - 35 ;     % price
           % Player #37 offers a selling block 110 with 15 JPY/kWh
                b37 = 110 ;      % resource
                c37 = - 15 ;     % price
           % Player #38 offers a selling block 115 with 25 JPY/kWh
                b38 = 115 ;      % resource
                c38 = - 25 ;     % price
           % Player #39 offers a selling block 100 with 15 JPY/kWh
                b39 = 100 ;      % resource
                c39 = - 15 ;     % price
           % Player #40 offers a selling block 125 with 20 JPY/kWh
                b40 = 125 ;      % resource
                c40 = - 20 ;     % price
           % Player #41 offers a selling block 115 with 15 JPY/kWh
                b41 = 115 ;      % resource
                c41 = - 15 ;     % price
           % Player #42 offers a selling block 100 with 20 JPY/kWh
                b42 = 100 ;      % resource
                c42 = - 20 ;     % price
           % Player #43 offers a selling block 120 with 25 JPY/kWh
                b43 = 120 ;      % resource
                c43 = - 25 ;     % price
           % Player #44 offers a selling block 100 with 15 JPY/kWh
                b44 = 100 ;      % resource
                c44 = - 15 ;     % price
           % Player #45 offers a selling block 130 with 25 JPY/kWh
                b45 = 130 ;      % resource
                c45 = - 25 ;     % price
           % Player #46 offers a selling block 125 with 25 JPY/kWh
                b46 = 125 ;      % resource
                c46 = - 25 ;     % price
           % Player #47 offers a selling block 120 with 30 JPY/kWh
                b47 = 120 ;      % resource
                c47 = - 30 ;     % price
           % Player #48 offers a selling block 115 with 25 JPY/kWh
                b48 = 115 ;      % resource
                c48 = - 25 ;     % price
           % Player #49 offers a selling block 105 with 10 JPY/kWh
                b49 = 105 ;      % resource
                c49 = - 10 ;     % price
           % Player #50 offers a selling block 120 with 20 JPY/kWh
                b50 = 120 ;      % resource
                c50 = - 20 ;     % price
                
                
                
                
        % Parameters of consumers
            % Player #51 bids a purchase block 70 with 15 JPY/kWh
                b51 = 70 ;       % resource
                c51 = 15 ;       % price
            % Player #52 bids a purchase block 80 with 25 JPY/kWh
                b52 = 80 ;       % resource
                c52 = 25 ;       % price
            % Player #53 bids a purchase block 75 with 15 JPY/kWh
                b53 = 75 ;       % resource
                c53 = 15 ;       % price
            % Player #54 bids a purchase block 85 with 25 JPY/kWh
                b54 = 85 ;       % resource
                c54 = 25 ;       % price
            % Player #55 bids a purchase block 90 with 15 JPY/kWh
                b55 = 90 ;       % resource
                c55 = 15 ;       % price
            % Player #56 bids a purchase block 75 with 25 JPY/kWh
                b56 = 75 ;       % resource
                c56 = 25 ;       % price
            % Player #57 bids a purchase block 95 with 25 JPY/kWh
                b57 = 95 ;       % resource
                c57 = 25 ;       % price
            % Player #58 bids a purchase block 80 with 25 JPY/kWh
                b58 = 80 ;       % resource
                c58 = 25 ;       % price
            % Player #59 bids a purchase block 90 with 20 JPY/kWh
                b59 = 90 ;       % resource
                c59 = 20 ;       % price
            % Player #60 bids a purchase block 105 with 30 JPY/kWh
                b60 = 105 ;       % resource
                c60 = 30 ;       % price
            % Player #61 bids a purchase block 70 with 15 JPY/kWh
                b61 = 70 ;       % resource
                c61 = 15 ;       % price
            % Player #62 bids a purchase block 75 with 20 JPY/kWh
                b62 = 75 ;       % resource
                c62 = 20 ;       % price
            % Player #63 bids a purchase block 80 with 20 JPY/kWh
                b63 = 80 ;       % resource
                c63 = 20 ;       % price
            % Player #64 bids a purchase block 75 with 20 JPY/kWh
                b64 = 75 ;       % resource
                c64 = 20 ;       % price
            % Player #65 bids a purchase block 65 with 10 JPY/kWh
                b65 = 65 ;       % resource
                c65 = 10 ;       % price
            % Player #66 bids a purchase block 85 with 25 JPY/kWh
                b66 = 85 ;       % resource
                c66 = 25 ;       % price
            % Player #67 bids a purchase block 75 with 15 JPY/kWh
                b67 = 75 ;       % resource
                c67 = 15 ;       % price
            % Player #68 bids a purchase block 80 with 20 JPY/kWh
                b68 = 80 ;       % resource
                c68 = 20 ;       % price
            % Player #69 bids a purchase block 100 with 20 JPY/kWh
                b69 = 100 ;       % resource
                c69 = 20 ;       % price
            % Player #70 bids a purchase block 90 with 30 JPY/kWh
                b70 = 90 ;       % resource
                c70 = 30 ;       % price
            % Player #71 bids a purchase block 80 with 15 JPY/kWh
                b71 = 80 ;       % resource
                c71 = 15 ;       % price
            % Player #72 bids a purchase block 95 with 20 JPY/kWh
                b72 = 95 ;       % resource
                c72 = 20 ;       % price
            % Player #73 bids a purchase block 70 with 10 JPY/kWh
                b73 = 70 ;       % resource
                c73 = 10 ;       % price
            % Player #74 bids a purchase block 85 with 20 JPY/kWh
                b74 = 85 ;       % resource
                c74 = 20 ;       % price
            % Player #75 bids a purchase block 90 with 20 JPY/kWh
                b75 = 90 ;       % resource
                c75 = 20 ;       % price
            % Player #76 bids a purchase block 75 with 25 JPY/kWh
                b76 = 75 ;       % resource
                c76 = 25 ;       % price
            % Player #77 bids a purchase block 105 with 25 JPY/kWh
                b77 = 105 ;       % resource
                c77 = 25 ;       % price
            % Player #78 bids a purchase block 60 with 15 JPY/kWh
                b78 = 60 ;       % resource
                c78 = 15 ;       % price
            % Player #79 bids a purchase block 100 with 20 JPY/kWh
                b79 = 100 ;       % resource
                c79 = 20 ;       % price
            % Player #80 bids a purchase block 85 with 30 JPY/kWh
                b80 = 85 ;       % resource
                c80 = 30 ;       % price
            % Player #81 bids a purchase block 75 with 15 JPY/kWh
                b81 = 75 ;       % resource
                c81 = 15 ;       % price
            % Player #82 bids a purchase block 90 with 20 JPY/kWh
                b82 = 90 ;       % resource
                c82 = 20 ;       % price
            % Player #83 bids a purchase block 70 with 20 JPY/kWh
                b83 = 70 ;       % resource
                c83 = 20 ;       % price
            % Player #84 bids a purchase block 75 with 20 JPY/kWh
                b84 = 75 ;       % resource
                c84 = 20 ;       % price
            % Player #85 bids a purchase block 85 with 30 JPY/kWh
                b85 = 85 ;       % resource
                c85 = 30 ;       % price
            % Player #86 bids a purchase block 95 with 25 JPY/kWh
                b86 = 95 ;       % resource
                c86 = 25 ;       % price
            % Player #87 bids a purchase block 65 with 15 JPY/kWh
                b87 = 65 ;       % resource
                c87 = 15 ;       % price
            % Player #88 bids a purchase block 100 with 25 JPY/kWh
                b88 = 100 ;       % resource
                c88 = 25 ;       % price
            % Player #89 bids a purchase block 90 with 20 JPY/kWh
                b89 = 90 ;       % resource
                c89 = 20 ;       % price
            % Player #90 bids a purchase block 90 with 20 JPY/kWh
                b90 = 90 ;       % resource
                c90 = 20 ;       % price
            % Player #91 bids a purchase block 80 with 15 JPY/kWh
                b91 = 80 ;       % resource
                c91 = 15 ;       % price
            % Player #92 bids a purchase block 85 with 20 JPY/kWh
                b92 = 85 ;       % resource
                c92 = 20 ;       % price
            % Player #93 bids a purchase block 100 with 30 JPY/kWh
                b93 = 100 ;       % resource
                c93 = 30 ;       % price
            % Player #94 bids a purchase block 95 with 20 JPY/kWh
                b94 = 95 ;       % resource
                c94 = 20 ;       % price
            % Player #95 bids a purchase block 90 with 20 JPY/kWh
                b95 = 90 ;       % resource
                c95 = 20 ;       % price
            % Player #96 bids a purchase block 75 with 25 JPY/kWh
                b96 = 75 ;       % resource
                c96 = 25 ;       % price
            % Player #97 bids a purchase block 85 with 15 JPY/kWh
                b97 = 85 ;       % resource
                c97 = 15 ;       % price
            % Player #98 bids a purchase block 90 with 25 JPY/kWh
                b98 = 90 ;       % resource
                c98 = 25 ;       % price
            % Player #99 bids a purchase block 105 with 30 JPY/kWh
                b99 = 105 ;       % resource
                c99 = 30 ;       % price
            % Player #100 bids a purchase block 95 with 20 JPY/kWh
                b100 = 95 ;       % resource
                c100 = 20 ;       % price
        % Parameters of line
            % Line susceptance Bline = 0.1 ;
                Bline = 100 ;
            % Line limit Sline = 30
                Sline = 30 ;
            
            

            
    % Formulation
        % Objective function: maximization of total profit
            % maximize   c3 * x3 + c4 * x4 + c1 * x1 + c2 * x2 + 0 * theta
            
        % Decision variables
            % [ x1, x2, x3, x4, theta ]
            
        % Constraints
            % 0 < x1 < b1
            % 0 < x2 < b2
            % 0 < x3 < b3
            % 0 < x4 < b4
            % -Sline/Bline < theta < Sline/Bline
            % x1 - x3 = Bline * ( 0 - theta )
            % x2 - x4 = Bline * theta

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






% Optimization using Gurobi optimizer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f_obj = [ c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80 c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 c92 c93 c94 c95 c96 c97 c98 c99 c100 0 ] ;
A = [ 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
      0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 ;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ;
      1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 1 ;
      0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 0 -1 -1 ;
      ] ;
      
      
      
      
      
      
b = [ b1 ;
      b2 ;
      b3 ;
      b4 ;
      b5 ;
      b6 ;
      b7 ;
      b8 ;
      b9 ;
      b10 ;
      b11 ;
      b12 ;
      b13 ;
      b14 ;
      b15 ;
      b16 ;
      b17 ;
      b18 ; 
      b19 ;
      b20 ;
      b21 ;
      b22 ;
      b23 ;
      b24 ;
      b25 ;
      b26 ;
      b27 ;
      b28 ;
      b29 ;
      b30 ;
      b31 ;
      b32 ;
      b33 ;
      b34 ;
      b35 ;
      b36 ;
      b37 ;
      b38 ;
      b39 ;
      b40 ;
      b41 ;
      b42 ;
      b43 ;
      b44 ;
      b45 ;
      b46 ;
      b47 ;
      b48 ;
      b49 ;
      b50 ;
      b51 ;
      b52 ;
      b53 ;
      b54 ;
      b55 ;
      b56 ;
      b57 ;
      b58 ;
      b59 ;
      b60 ;
      b61 ;
      b62 ;
      b63 ;
      b64 ;
      b65 ;
      b66 ;
      b67 ;
      b68 ;
      b69 ;
      b70 ;
      b71 ;
      b72 ;
      b73 ;
      b74 ;
      b75 ;
      b76 ;
      b77 ;
      b78 ;
      b79 ;
      b80 ;
      b81 ;
      b82 ;
      b83 ;
      b84 ;
      b85 ;
      b86 ;
      b87 ;
      b88 ;
      b89 ;
      b90 ;
      b91 ;
      b92 ;
      b93 ;
      b94 ;
      b95 ;
      b96 ;
      b97 ;
      b98 ;
      b99 ;
      b100;
      Sline/Bline ;
      Sline/Bline ] ;
      
Aeq = [ 1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0  Bline ;
        0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1  0  1   0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1  0 -1 -Bline ] ;
       
beq = zeros( 2 , 1 ) ;
clearvars -except A Aeq f_obj b beq Sline Bline  ;
    % delete unnecessary variables for readability
% clearvars -except A Aeq f_obj b beq Sline Bline  ;

result = optimization_gurobi2( A , Aeq , f_obj , b , beq ) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




fprintf( '<Optimization result>\n\n' ) ;


    % Decision variables
x1 = result.x( 1 , 1 ) ;
x2 = result.x( 2 , 1 ) ;
x3 = result.x( 3 , 1 ) ;
x4 = result.x( 4 , 1 ) ;
x5 = result.x( 5 , 1 ) ;
x6 = result.x( 6 , 1 ) ;
x7 = result.x( 7 , 1 ) ;
x8 = result.x( 8 , 1 ) ;
x9 = result.x( 9 , 1 ) ;
x10 = result.x( 10 , 1 ) ;
x11 = result.x( 11 , 1 ) ;
x12 = result.x( 12 , 1 ) ;
x13 = result.x( 13 , 1 ) ;
x14 = result.x( 14 , 1 ) ;
x15 = result.x( 15 , 1 ) ;
x16 = result.x( 16 , 1 ) ;
x17 = result.x( 17 , 1 ) ;
x18 = result.x( 18 , 1 ) ;
x19 = result.x( 19 , 1 ) ;
x20 = result.x( 20 , 1 ) ;
x21 = result.x( 21 , 1 ) ;
x22 = result.x( 22 , 1 ) ;
x23 = result.x( 23 , 1 ) ;
x24 = result.x( 24 , 1 ) ;
x25 = result.x( 25 , 1 ) ;
x26 = result.x( 26 , 1 ) ;
x27 = result.x( 27 , 1 ) ;
x28 = result.x( 28 , 1 ) ;
x29 = result.x( 29 , 1 ) ;
x30 = result.x( 30 , 1 ) ;
x31 = result.x( 31 , 1 ) ;
x32 = result.x( 32 , 1 ) ;
x33 = result.x( 33 , 1 ) ;
x34 = result.x( 34 , 1 ) ;
x35 = result.x( 35 , 1 ) ;
x36 = result.x( 36 , 1 ) ;
x37 = result.x( 37 , 1 ) ;
x38 = result.x( 38 , 1 ) ;
x39 = result.x( 39 , 1 ) ;
x40 = result.x( 40 , 1 ) ;
x41 = result.x( 41 , 1 ) ;
x42 = result.x( 42 , 1 ) ;
x43 = result.x( 43 , 1 ) ;
x44 = result.x( 44 , 1 ) ;
x45 = result.x( 45 , 1 ) ;
x46 = result.x( 46 , 1 ) ;
x47 = result.x( 47 , 1 ) ;
x48 = result.x( 48 , 1 ) ;
x49 = result.x( 49 , 1 ) ;
x50 = result.x( 50 , 1 ) ;
x51 = result.x( 51 , 1 ) ;
x52 = result.x( 52 , 1 ) ;
x53 = result.x( 53 , 1 ) ;
x54 = result.x( 54 , 1 ) ;
x55 = result.x( 55 , 1 ) ;
x56 = result.x( 56 , 1 ) ;
x57 = result.x( 57 , 1 ) ;
x58 = result.x( 58 , 1 ) ;
x59 = result.x( 59 , 1 ) ;
x60 = result.x( 60 , 1 ) ;
x61 = result.x( 61 , 1 ) ;
x62 = result.x( 62 , 1 ) ;
x63 = result.x( 63 , 1 ) ;
x64 = result.x( 64 , 1 ) ;
x65 = result.x( 65 , 1 ) ;
x66 = result.x( 66 , 1 ) ;
x67 = result.x( 67 , 1 ) ;
x68 = result.x( 68 , 1 ) ;
x69 = result.x( 69 , 1 ) ;
x70 = result.x( 70 , 1 ) ;
x71 = result.x( 71 , 1 ) ;
x72 = result.x( 72 , 1 ) ;
x73 = result.x( 73 , 1 ) ;
x74 = result.x( 74 , 1 ) ;
x75 = result.x( 75 , 1 ) ;
x76 = result.x( 76 , 1 ) ;
x77 = result.x( 77 , 1 ) ;
x78 = result.x( 78 , 1 ) ;
x79 = result.x( 79 , 1 ) ;
x80 = result.x( 80 , 1 ) ;
x81 = result.x( 81 , 1 ) ;
x82 = result.x( 82 , 1 ) ;
x83 = result.x( 83 , 1 ) ;
x84 = result.x( 84 , 1 ) ;
x85 = result.x( 85 , 1 ) ;
x86 = result.x( 86 , 1 ) ;
x87 = result.x( 87 , 1 ) ;
x88 = result.x( 88 , 1 ) ;
x89 = result.x( 89 , 1 ) ;
x90 = result.x( 90 , 1 ) ;
x91 = result.x( 91 , 1 ) ;
x92 = result.x( 92 , 1 ) ;
x93 = result.x( 93 , 1 ) ;
x94 = result.x( 94 , 1 ) ;
x95 = result.x( 95 , 1 ) ;
x96 = result.x( 96 , 1 ) ;
x97 = result.x( 97 , 1 ) ;
x98 = result.x( 98 , 1 ) ;
x99 = result.x( 99 , 1 ) ;
x100 = result.x( 100 , 1 ) ;
theta = result.x( 101 , 1 ) ;
P12 = - Bline * theta ;
fprintf( 'Player #1 (producer) generates %.2f and sells it\n' , x1 ) ;
fprintf( 'Player #2 (producer) generates %.2f and sells it\n' , x2 ) ;
fprintf( 'Player #3 (producer) generates %.2f and sells it\n' , x3 ) ;
fprintf( 'Player #4 (producer) generates %.2f and sells it\n' , x4 ) ;
fprintf( 'Player #5 (producer) generates %.2f and sells it\n' , x5 ) ;
fprintf( 'Player #6 (producer) generates %.2f and sells it\n' , x6 ) ;
fprintf( 'Player #7 (producer) generates %.2f and sells it\n' , x7 ) ;
fprintf( 'Player #8 (producer) generates %.2f and sells it\n' , x8 ) ;
fprintf( 'Player #9 (producer) generates %.2f and sells it\n' , x9 ) ;
fprintf( 'Player #10 (producer) generates %.2f and sells it\n' , x10 ) ;
fprintf( 'Player #11 (producer) generates %.2f and sells it\n' , x11 ) ;
fprintf( 'Player #12 (producer) generates %.2f and sells it\n' , x12 ) ;
fprintf( 'Player #13 (producer) generates %.2f and sells it\n' , x13 ) ;
fprintf( 'Player #14 (producer) generates %.2f and sells it\n' , x14 ) ;
fprintf( 'Player #15 (producer) generates %.2f and sells it\n' , x15 ) ;
fprintf( 'Player #16 (producer) generates %.2f and sells it\n' , x16 ) ;
fprintf( 'Player #17 (producer) generates %.2f and sells it\n' , x17 ) ;
fprintf( 'Player #18 (producer) generates %.2f and sells it\n' , x18 ) ;
fprintf( 'Player #19 (producer) generates %.2f and sells it\n' , x19 ) ;
fprintf( 'Player #20 (producer) generates %.2f and sells it\n' , x20 ) ;
fprintf( 'Player #21 (producer) generates %.2f and sells it\n' , x21 ) ;
fprintf( 'Player #22 (producer) generates %.2f and sells it\n' , x22 ) ;
fprintf( 'Player #23 (producer) generates %.2f and sells it\n' , x23 ) ;
fprintf( 'Player #24 (producer) generates %.2f and sells it\n' , x24 ) ;
fprintf( 'Player #25 (producer) generates %.2f and sells it\n' , x25 ) ;
fprintf( 'Player #26 (producer) generates %.2f and sells it\n' , x26 ) ;
fprintf( 'Player #27 (producer) generates %.2f and sells it\n' , x27 ) ;
fprintf( 'Player #28 (producer) generates %.2f and sells it\n' , x28 ) ;
fprintf( 'Player #29 (producer) generates %.2f and sells it\n' , x29 ) ;
fprintf( 'Player #30 (producer) generates %.2f and sells it\n' , x30 ) ;
fprintf( 'Player #31 (producer) generates %.2f and sells it\n' , x31 ) ;
fprintf( 'Player #32 (producer) generates %.2f and sells it\n' , x32 ) ;
fprintf( 'Player #33 (producer) generates %.2f and sells it\n' , x33 ) ;
fprintf( 'Player #34 (producer) generates %.2f and sells it\n' , x34 ) ;
fprintf( 'Player #35 (producer) generates %.2f and sells it\n' , x35 ) ;
fprintf( 'Player #36 (producer) generates %.2f and sells it\n' , x36 ) ;
fprintf( 'Player #37 (producer) generates %.2f and sells it\n' , x37 ) ;
fprintf( 'Player #38 (producer) generates %.2f and sells it\n' , x38 ) ;
fprintf( 'Player #39 (producer) generates %.2f and sells it\n' , x39 ) ;
fprintf( 'Player #40 (producer) generates %.2f and sells it\n' , x40 ) ;
fprintf( 'Player #41 (producer) generates %.2f and sells it\n' , x41 ) ;
fprintf( 'Player #42 (producer) generates %.2f and sells it\n' , x42 ) ;
fprintf( 'Player #43 (producer) generates %.2f and sells it\n' , x43 ) ;
fprintf( 'Player #44 (producer) generates %.2f and sells it\n' , x44 ) ;
fprintf( 'Player #45 (producer) generates %.2f and sells it\n' , x45 ) ;
fprintf( 'Player #46 (producer) generates %.2f and sells it\n' , x46 ) ;
fprintf( 'Player #47 (producer) generates %.2f and sells it\n' , x47 ) ;
fprintf( 'Player #48 (producer) generates %.2f and sells it\n' , x48 ) ;
fprintf( 'Player #49 (producer) generates %.2f and sells it\n' , x49 ) ;
fprintf( 'Player #50 (producer) generates %.2f and sells it\n' , x50 ) ;
fprintf( 'Player #51 (consumer) buys %.2f and sells it\n' , x51 ) ;
fprintf( 'Player #52 (consumer) buys %.2f and sells it\n' , x52 ) ;
fprintf( 'Player #53 (consumer) buys %.2f and sells it\n' , x53 ) ;
fprintf( 'Player #54 (consumer) buys %.2f and sells it\n' , x54 ) 
fprintf( 'Player #55 (consumer) buys %.2f and sells it\n' , x55 ) ;
fprintf( 'Player #56 (consumer) buys %.2f and sells it\n' , x56 ) ;
fprintf( 'Player #57 (consumer) buys %.2f and sells it\n' , x57 ) ;
fprintf( 'Player #58 (consumer) buys %.2f and sells it\n' , x58 ) ;
fprintf( 'Player #59 (consumer) buys %.2f and sells it\n' , x59 ) ;
fprintf( 'Player #60 (consumer) buys %.2f and sells it\n' , x60 ) ;
fprintf( 'Player #61 (consumer) buys %.2f and sells it\n' , x61 ) ;
fprintf( 'Player #62 (consumer) buys %.2f and sells it\n' , x62 ) ;
fprintf( 'Player #63 (consumer) buys %.2f and sells it\n' , x63 ) ;
fprintf( 'Player #64 (consumer) buys %.2f and sells it\n' , x64 ) 
fprintf( 'Player #65 (consumer) buys %.2f and sells it\n' , x65 ) ;
fprintf( 'Player #66 (consumer) buys %.2f and sells it\n' , x66 ) ;
fprintf( 'Player #67 (consumer) buys %.2f and sells it\n' , x67 ) ;
fprintf( 'Player #68 (consumer) buys %.2f and sells it\n' , x68 ) ;
fprintf( 'Player #69 (consumer) buys %.2f and sells it\n' , x69 ) ;
fprintf( 'Player #70 (consumer) buys %.2f and sells it\n' , x70 ) ;
fprintf( 'Player #71 (consumer) buys %.2f and sells it\n' , x71 ) ;
fprintf( 'Player #72 (consumer) buys %.2f and sells it\n' , x72 ) ;
fprintf( 'Player #73 (consumer) buys %.2f and sells it\n' , x73 ) ;
fprintf( 'Player #74 (consumer) buys %.2f and sells it\n' , x74 ) 
fprintf( 'Player #75 (consumer) buys %.2f and sells it\n' , x75 ) ;
fprintf( 'Player #76 (consumer) buys %.2f and sells it\n' , x76 ) ;
fprintf( 'Player #77 (consumer) buys %.2f and sells it\n' , x77 ) ;
fprintf( 'Player #78 (consumer) buys %.2f and sells it\n' , x78 ) ;
fprintf( 'Player #79 (consumer) buys %.2f and sells it\n' , x79 ) ;
fprintf( 'Player #80 (consumer) buys %.2f and sells it\n' , x80 ) ;
fprintf( 'Player #81 (consumer) buys %.2f and sells it\n' , x81 ) ;
fprintf( 'Player #82 (consumer) buys %.2f and sells it\n' , x82 ) ;
fprintf( 'Player #83 (consumer) buys %.2f and sells it\n' , x83 ) ;
fprintf( 'Player #84 (consumer) buys %.2f and sells it\n' , x84 ) 
fprintf( 'Player #85 (consumer) buys %.2f and sells it\n' , x85 ) ;
fprintf( 'Player #86 (consumer) buys %.2f and sells it\n' , x86 ) ;
fprintf( 'Player #87 (consumer) buys %.2f and sells it\n' , x87 ) ;
fprintf( 'Player #88 (consumer) buys %.2f and sells it\n' , x88 ) ;
fprintf( 'Player #89 (consumer) buys %.2f and sells it\n' , x89 ) ;
fprintf( 'Player #90 (consumer) buys %.2f and sells it\n' , x90 ) ;
fprintf( 'Player #91 (consumer) buys %.2f and sells it\n' , x91 ) ;
fprintf( 'Player #92 (consumer) buys %.2f and sells it\n' , x92 ) ;
fprintf( 'Player #93 (consumer) buys %.2f and sells it\n' , x93 ) ;
fprintf( 'Player #94 (consumer) buys %.2f and sells it\n' , x94 ) 
fprintf( 'Player #95 (consumer) buys %.2f and sells it\n' , x95 ) ;
fprintf( 'Player #96 (consumer) buys %.2f and sells it\n' , x96 ) ;
fprintf( 'Player #97 (consumer) buys %.2f and sells it\n' , x97 ) ;
fprintf( 'Player #98 (consumer) buys %.2f and sells it\n' , x98 ) ;
fprintf( 'Player #99 (consumer) buys %.2f and sells it\n' , x99 ) ;
fprintf( 'Player #100 (consumer) buys %.2f and sells it\n' , x100 ) ;
fprintf( 'Power flows %.2f from microgrid #1 to #2\n\n' , P12 ) ;


    % shadow price
y1 = result.pi( 1 , 1 ) ;
y2 = result.pi( 2 , 1 ) ;
y3 = result.pi( 3 , 1 ) ;
y4 = result.pi( 4 , 1 ) ;
y5 = result.pi( 5 , 1 ) ;
y6 = result.pi( 6 , 1 ) ;
y7 = result.pi( 7 , 1 ) ;
y8 = result.pi( 8 , 1 ) ;
y9 = result.pi( 9 , 1 ) ;
y10 = result.pi( 10 , 1 ) ;
y11 = result.pi( 11 , 1 ) ;
y12 = result.pi( 12 , 1 ) ;
y13 = result.pi( 13 , 1 ) ;
y14 = result.pi( 14 , 1 ) ;
y15 = result.pi( 15 , 1 ) ;
y16 = result.pi( 16 , 1 ) ;
y17 = result.pi( 17 , 1 ) ;
y18 = result.pi( 18 , 1 ) ;
y19 = result.pi( 19 , 1 ) ;
y20 = result.pi( 20 , 1 ) ;
y21 = result.pi( 21 , 1 ) ;
y22 = result.pi( 22 , 1 ) ;
y23 = result.pi( 23 , 1 ) ;
y24 = result.pi( 24 , 1 ) ;
y25 = result.pi( 25 , 1 ) ;
y26 = result.pi( 26 , 1 ) ;
y27 = result.pi( 27 , 1 ) ;
y28 = result.pi( 28 , 1 ) ;
y29 = result.pi( 29 , 1 ) ;
y30 = result.pi( 30 , 1 ) ;
y31 = result.pi( 31 , 1 ) ;
y32 = result.pi( 32 , 1 ) ;
y33 = result.pi( 33 , 1 ) ;
y34 = result.pi( 34 , 1 ) ;
y35 = result.pi( 35 , 1 ) ;
y36 = result.pi( 36 , 1 ) ;
y37 = result.pi( 37 , 1 ) ;
y38 = result.pi( 38 , 1 ) ;
y39 = result.pi( 39 , 1 ) ;
y40 = result.pi( 40 , 1 ) ;
y41 = result.pi( 41 , 1 ) ;
y42 = result.pi( 42 , 1 ) ;
y43 = result.pi( 43 , 1 ) ;
y44 = result.pi( 44 , 1 ) ;
y45 = result.pi( 45 , 1 ) ;
y46 = result.pi( 46 , 1 ) ;
y47 = result.pi( 47 , 1 ) ;
y48 = result.pi( 48 , 1 ) ;
y49 = result.pi( 49 , 1 ) ;
y50 = result.pi( 50 , 1 ) ;
y51 = result.pi( 51 , 1 ) ;
y52 = result.pi( 52 , 1 ) ;
y53 = result.pi( 53 , 1 ) ;
y54 = result.pi( 54 , 1 ) ;
y55 = result.pi( 55 , 1 ) ;
y56 = result.pi( 56 , 1 ) ;
y57 = result.pi( 57 , 1 ) ;
y58 = result.pi( 58 , 1 ) ;
y59 = result.pi( 59 , 1 ) ;
y60 = result.pi( 60 , 1 ) ;
y61 = result.pi( 61 , 1 ) ;
y62 = result.pi( 62 , 1 ) ;
y63 = result.pi( 63 , 1 ) ;
y64 = result.pi( 64 , 1 ) ;
y65 = result.pi( 65 , 1 ) ;
y66 = result.pi( 66 , 1 ) ;
y67 = result.pi( 67 , 1 ) ;
y68 = result.pi( 68 , 1 ) ;
y69 = result.pi( 69 , 1 ) ;
y70 = result.pi( 70 , 1 ) ;
y71 = result.pi( 71 , 1 ) ;
y72 = result.pi( 72 , 1 ) ;
y73 = result.pi( 73 , 1 ) ;
y74 = result.pi( 74 , 1 ) ;
y75 = result.pi( 75 , 1 ) ;
y76 = result.pi( 76 , 1 ) ;
y77 = result.pi( 77 , 1 ) ;
y78 = result.pi( 78 , 1 ) ;
y79 = result.pi( 79 , 1 ) ;
y80 = result.pi( 80 , 1 ) ;
y81 = result.pi( 81 , 1 ) ;
y82 = result.pi( 82 , 1 ) ;
y83 = result.pi( 83 , 1 ) ;
y84 = result.pi( 84 , 1 ) ;
y85 = result.pi( 85 , 1 ) ;
y86 = result.pi( 86 , 1 ) ;
y87 = result.pi( 87 , 1 ) ;
y88 = result.pi( 88 , 1 ) ;
y89 = result.pi( 89 , 1 ) ;
y90 = result.pi( 90 , 1 ) ;
y91 = result.pi( 91 , 1 ) ;
y92 = result.pi( 92 , 1 ) ;
y93 = result.pi( 93 , 1 ) ;
y94 = result.pi( 94 , 1 ) ;
y95 = result.pi( 95 , 1 ) ;
y96 = result.pi( 96 , 1 ) ;
y97 = result.pi( 97 , 1 ) ;
y98 = result.pi( 98 , 1 ) ;
y99 = result.pi( 99 , 1 ) ;
y100 = result.pi( 100 , 1 ) ;
fprintf( 'The shadow price of resource possessed by player #1 (producer) is %.2f\n' , y1 ) ;
fprintf( 'The shadow price of resource possessed by player #2 (producer) is %.2f\n' , y2 ) ;
fprintf( 'The shadow price of resource possessed by player #3 (producer) is %.2f\n' , y3 ) ;
fprintf( 'The shadow price of resource possessed by player #4 (producer) is %.2f\n' , y4 ) ;
fprintf( 'The shadow price of resource possessed by player #5 (producer) is %.2f\n' , y5 ) ;
fprintf( 'The shadow price of resource possessed by player #6 (producer) is %.2f\n' , y6 ) ;
fprintf( 'The shadow price of resource possessed by player #7 (producer) is %.2f\n' , y7 ) ;
fprintf( 'The shadow price of resource possessed by player #8 (producer) is %.2f\n' , y8 ) ;
fprintf( 'The shadow price of resource possessed by player #9 (producer) is %.2f\n' , y9 ) ;
fprintf( 'The shadow price of resource possessed by player #10 (producer) is %.2f\n' , y10 ) ;
fprintf( 'The shadow price of resource possessed by player #11 (producer) is %.2f\n' , y11 ) ;
fprintf( 'The shadow price of resource possessed by player #12 (producer) is %.2f\n' , y12 ) ;
fprintf( 'The shadow price of resource possessed by player #13 (producer) is %.2f\n' , y13 ) ;
fprintf( 'The shadow price of resource possessed by player #14 (producer) is %.2f\n' , y14 ) ;
fprintf( 'The shadow price of resource possessed by player #15 (producer) is %.2f\n' , y15 ) ;
fprintf( 'The shadow price of resource possessed by player #16 (producer) is %.2f\n' , y16 ) ;
fprintf( 'The shadow price of resource possessed by player #17 (producer) is %.2f\n' , y17 ) ;
fprintf( 'The shadow price of resource possessed by player #18 (producer) is %.2f\n' , y18 ) ;
fprintf( 'The shadow price of resource possessed by player #19 (producer) is %.2f\n' , y19 ) ;
fprintf( 'The shadow price of resource possessed by player #20 (producer) is %.2f\n' , y20 ) ;
fprintf( 'The shadow price of resource possessed by player #21 (producer) is %.2f\n' , y21 ) ;
fprintf( 'The shadow price of resource possessed by player #22 (producer) is %.2f\n' , y22 ) ;
fprintf( 'The shadow price of resource possessed by player #23 (producer) is %.2f\n' , y23 ) ;
fprintf( 'The shadow price of resource possessed by player #24 (producer) is %.2f\n' , y24 ) ;
fprintf( 'The shadow price of resource possessed by player #25 (producer) is %.2f\n' , y25 ) ;
fprintf( 'The shadow price of resource possessed by player #26 (producer) is %.2f\n' , y26 ) ;
fprintf( 'The shadow price of resource possessed by player #27 (producer) is %.2f\n' , y27 ) ;
fprintf( 'The shadow price of resource possessed by player #28 (producer) is %.2f\n' , y28 ) ;
fprintf( 'The shadow price of resource possessed by player #29 (producer) is %.2f\n' , y29 ) ;
fprintf( 'The shadow price of resource possessed by player #30 (producer) is %.2f\n' , y30 ) ;
fprintf( 'The shadow price of resource possessed by player #31 (producer) is %.2f\n' , y31 ) ;
fprintf( 'The shadow price of resource possessed by player #32 (producer) is %.2f\n' , y32 ) ;
fprintf( 'The shadow price of resource possessed by player #33 (producer) is %.2f\n' , y33 ) ;
fprintf( 'The shadow price of resource possessed by player #34 (producer) is %.2f\n' , y34 ) ;
fprintf( 'The shadow price of resource possessed by player #35 (producer) is %.2f\n' , y35 ) ;
fprintf( 'The shadow price of resource possessed by player #36 (producer) is %.2f\n' , y36 ) ;
fprintf( 'The shadow price of resource possessed by player #37 (producer) is %.2f\n' , y37 ) ;
fprintf( 'The shadow price of resource possessed by player #38 (producer) is %.2f\n' , y38 ) ;
fprintf( 'The shadow price of resource possessed by player #39 (producer) is %.2f\n' , y39 ) ;
fprintf( 'The shadow price of resource possessed by player #40 (producer) is %.2f\n' , y40 ) ;
fprintf( 'The shadow price of resource possessed by player #41 (producer) is %.2f\n' , y41 ) ;
fprintf( 'The shadow price of resource possessed by player #42 (producer) is %.2f\n' , y42 ) ;
fprintf( 'The shadow price of resource possessed by player #43 (producer) is %.2f\n' , y43 ) ;
fprintf( 'The shadow price of resource possessed by player #44 (producer) is %.2f\n' , y44 ) ;
fprintf( 'The shadow price of resource possessed by player #45 (producer) is %.2f\n' , y45 ) ;
fprintf( 'The shadow price of resource possessed by player #46 (producer) is %.2f\n' , y46 ) ;
fprintf( 'The shadow price of resource possessed by player #47 (producer) is %.2f\n' , y47 ) ;
fprintf( 'The shadow price of resource possessed by player #48 (producer) is %.2f\n' , y48 ) ;
fprintf( 'The shadow price of resource possessed by player #49 (producer) is %.2f\n' , y49 ) ;
fprintf( 'The shadow price of resource possessed by player #50 (producer) is %.2f\n' , y50 ) ;
fprintf( 'The shadow price of resource possessed by player #51 (consumer) is %.2f\n' , y51 ) ;
fprintf( 'The shadow price of resource possessed by player #52 (consumer) is %.2f\n' , y52 ) ;
fprintf( 'The shadow price of resource possessed by player #53 (consumer) is %.2f\n' , y53 ) ;
fprintf( 'The shadow price of resource possessed by player #54 (consumer) is %.2f\n' , y54 ) ;
fprintf( 'The shadow price of resource possessed by player #55 (consumer) is %.2f\n' , y55 ) ;
fprintf( 'The shadow price of resource possessed by player #56 (consumer) is %.2f\n' , y56 ) ;
fprintf( 'The shadow price of resource possessed by player #57 (consumer) is %.2f\n' , y57 ) ;
fprintf( 'The shadow price of resource possessed by player #58 (consumer) is %.2f\n' , y58 ) ;
fprintf( 'The shadow price of resource possessed by player #59 (consumer) is %.2f\n' , y59 ) ;
fprintf( 'The shadow price of resource possessed by player #60 (consumer) is %.2f\n' , y60 ) ;
fprintf( 'The shadow price of resource possessed by player #61 (consumer) is %.2f\n' , y61 ) ;
fprintf( 'The shadow price of resource possessed by player #62 (consumer) is %.2f\n' , y62 ) ;
fprintf( 'The shadow price of resource possessed by player #63 (consumer) is %.2f\n' , y63 ) ;
fprintf( 'The shadow price of resource possessed by player #64 (consumer) is %.2f\n' , y64 ) ;
fprintf( 'The shadow price of resource possessed by player #65 (consumer) is %.2f\n' , y65 ) ;
fprintf( 'The shadow price of resource possessed by player #66 (consumer) is %.2f\n' , y66 ) ;
fprintf( 'The shadow price of resource possessed by player #67 (consumer) is %.2f\n' , y67 ) ;
fprintf( 'The shadow price of resource possessed by player #68 (consumer) is %.2f\n' , y68 ) ;
fprintf( 'The shadow price of resource possessed by player #69 (consumer) is %.2f\n' , y69 ) ;
fprintf( 'The shadow price of resource possessed by player #70 (consumer) is %.2f\n' , y70 ) ;
fprintf( 'The shadow price of resource possessed by player #71 (consumer) is %.2f\n' , y71 ) ;
fprintf( 'The shadow price of resource possessed by player #72 (consumer) is %.2f\n' , y72 ) ;
fprintf( 'The shadow price of resource possessed by player #73 (consumer) is %.2f\n' , y73 ) ;
fprintf( 'The shadow price of resource possessed by player #74 (consumer) is %.2f\n' , y74 ) ;
fprintf( 'The shadow price of resource possessed by player #75 (consumer) is %.2f\n' , y75 ) ;
fprintf( 'The shadow price of resource possessed by player #76 (consumer) is %.2f\n' , y76 ) ;
fprintf( 'The shadow price of resource possessed by player #77 (consumer) is %.2f\n' , y77 ) ;
fprintf( 'The shadow price of resource possessed by player #78 (consumer) is %.2f\n' , y78 ) ;
fprintf( 'The shadow price of resource possessed by player #79 (consumer) is %.2f\n' , y79 ) ;
fprintf( 'The shadow price of resource possessed by player #80 (consumer) is %.2f\n' , y80 ) ;
fprintf( 'The shadow price of resource possessed by player #81 (consumer) is %.2f\n' , y81 ) ;
fprintf( 'The shadow price of resource possessed by player #82 (consumer) is %.2f\n' , y82 ) ;
fprintf( 'The shadow price of resource possessed by player #83 (consumer) is %.2f\n' , y83 ) ;
fprintf( 'The shadow price of resource possessed by player #84 (consumer) is %.2f\n' , y84 ) ;
fprintf( 'The shadow price of resource possessed by player #85 (consumer) is %.2f\n' , y85 ) ;
fprintf( 'The shadow price of resource possessed by player #86 (consumer) is %.2f\n' , y86 ) ;
fprintf( 'The shadow price of resource possessed by player #87 (consumer) is %.2f\n' , y87 ) ;
fprintf( 'The shadow price of resource possessed by player #88 (consumer) is %.2f\n' , y88 ) ;
fprintf( 'The shadow price of resource possessed by player #89 (consumer) is %.2f\n' , y89 ) ;
fprintf( 'The shadow price of resource possessed by player #90 (consumer) is %.2f\n' , y90 ) ;
fprintf( 'The shadow price of resource possessed by player #91 (consumer) is %.2f\n' , y91 ) ;
fprintf( 'The shadow price of resource possessed by player #92 (consumer) is %.2f\n' , y92 ) ;
fprintf( 'The shadow price of resource possessed by player #93 (consumer) is %.2f\n' , y93 ) ;
fprintf( 'The shadow price of resource possessed by player #94 (consumer) is %.2f\n' , y94 ) ;
fprintf( 'The shadow price of resource possessed by player #95 (consumer) is %.2f\n' , y95 ) ;
fprintf( 'The shadow price of resource possessed by player #96 (consumer) is %.2f\n' , y96 ) ;
fprintf( 'The shadow price of resource possessed by player #97 (consumer) is %.2f\n' , y97 ) ;
fprintf( 'The shadow price of resource possessed by player #98 (consumer) is %.2f\n' , y98 ) ;
fprintf( 'The shadow price of resource possessed by player #99 (consumer) is %.2f\n' , y99 ) ;
fprintf( 'The shadow price of resource possessed by player #100 (consumer) is %.2f\n' , y100 ) ;

yline1 = result.pi( 101 , 1 ) ;
yline2 = result.pi( 102 , 1 ) ;
if yline1 > 0
    fprintf( 'The shadow price of line capacity is %.2f\n\n' , yline1 ) ;
else
    fprintf( 'The shadow price of line capacity is %.2f\n\n' , yline2 ) ;
end



% imputation in the core
u1 = y1 * b1 ;
u2 = y2 * b2 ;
u3 = y3 * b3 ;
u4 = y4 * b4 ;
u5 = y5 * b5 ;
u6 = y6 * b6 ;
u7 = y7 * b7 ;
u8 = y8 * b8 ;
u9 = y9 * b9 ;
u10 = y10 * b10 ;
u11 = y11 * b11 ;
u12 = y12 * b12 ;
u13 = y13 * b13 ;
u14 = y14 * b14 ;
u15 = y15 * b15 ;
u16 = y16 * b16 ;
u17 = y17 * b17 ;
u18 = y18 * b18 ;
u19 = y19 * b19 ;
u20 = y20 * b20 ;
u21 = y21 * b21 ;
u22 = y22 * b22 ;
u23 = y23 * b23 ;
u24 = y24 * b24 ;
u25 = y25 * b25 ;
u26 = y26 * b26 ;
u27 = y27 * b27 ;
u28 = y28 * b28 ;
u29 = y29 * b29 ;
u30 = y30 * b30 ;
u31 = y31 * b31 ;
u32 = y32 * b32 ;
u33 = y33 * b33 ;
u34 = y34 * b34 ;
u35 = y35 * b35 ;
u36 = y36 * b36 ;
u37 = y37 * b37 ;
u38 = y38 * b38 ;
u39 = y39 * b39 ;
u40 = y40 * b40 ;
u41 = y41 * b41 ;
u42 = y42 * b42 ;
u43 = y43 * b43 ;
u44 = y44 * b44 ;
u45 = y45 * b45 ;
u46 = y46 * b46 ;
u47 = y47 * b47 ;
u48 = y48 * b48 ;
u49 = y49 * b49 ;
u50 = y50 * b50 ;
u51 = y51 * b51 ;
u52 = y52 * b52 ;
u53 = y53 * b53 ;
u54 = y54 * b54 ;
u55 = y55 * b55 ;
u56 = y56 * b56 ;
u57 = y57 * b57 ;
u58 = y58 * b58 ;
u59 = y59 * b59 ;
u60 = y60 * b60 ;
u61 = y61 * b61 ;
u62 = y62 * b62 ;
u63 = y63 * b63 ;
u64 = y64 * b64 ;
u65 = y65 * b65 ;
u66 = y66 * b66 ;
u67 = y67 * b67 ;
u68 = y68 * b68 ;
u69 = y69 * b69 ;
u70 = y70 * b70 ;
u71 = y71 * b71 ;
u72 = y72 * b72 ;
u73 = y73 * b73 ;
u74 = y74 * b74 ;
u75 = y75 * b75 ;
u76 = y76 * b76 ;
u77 = y77 * b77 ;
u78 = y78 * b78 ;
u79 = y79 * b79 ;
u80 = y80 * b80 ;
u81 = y81 * b81 ;
u82 = y82 * b82 ;
u83 = y83 * b83 ;
u84 = y84 * b84 ;
u85 = y85 * b85 ;
u86 = y86 * b86 ;
u87 = y87 * b87 ;
u88 = y88 * b88 ;
u89 = y89 * b89 ;
u90 = y90 * b90 ;
u91 = y91 * b91 ;
u92 = y92 * b92 ;
u93 = y93 * b93 ;
u94 = y94 * b94 ;
u95 = y95 * b95 ;
u96 = y96 * b96 ;
u97 = y97 * b97 ;
u98 = y98 * b98 ;
u99 = y99 * b99 ;
u100 = y100 * b100 ;
uline = yline1 * Sline/Bline + yline2 * Sline/Bline ;
fprintf( 'The imputation of player #1 (producer) is %.4f\n' , u1 ) ;
fprintf( 'The imputation of player #2 (producer) is %.4f\n' , u2 ) ;
fprintf( 'The imputation of player #3 (producer) is %.4f\n' , u3 ) ;
fprintf( 'The imputation of player #4 (producer) is %.4f\n' , u4 ) ;
fprintf( 'The imputation of player #5 (producer) is %.4f\n' , u5 ) ;
fprintf( 'The imputation of player #6 (producer) is %.4f\n' , u6 ) ;
fprintf( 'The imputation of player #7 (producer) is %.4f\n' , u7 ) ;
fprintf( 'The imputation of player #8 (producer) is %.4f\n' , u8 ) ;
fprintf( 'The imputation of player #9 (producer) is %.4f\n' , u9 ) ;
fprintf( 'The imputation of player #10 (producer) is %.4f\n' , u10 ) ;
fprintf( 'The imputation of player #11 (producer) is %.4f\n' , u11 ) ;
fprintf( 'The imputation of player #12 (producer) is %.4f\n' , u12 ) ;
fprintf( 'The imputation of player #13 (producer) is %.4f\n' , u13 ) ;
fprintf( 'The imputation of player #14 (producer) is %.4f\n' , u14 ) ;
fprintf( 'The imputation of player #15 (producer) is %.4f\n' , u15 ) ;
fprintf( 'The imputation of player #16 (producer) is %.4f\n' , u16 ) ;
fprintf( 'The imputation of player #17 (producer) is %.4f\n' , u17 ) ;
fprintf( 'The imputation of player #18 (producer) is %.4f\n' , u18 ) ;
fprintf( 'The imputation of player #19 (producer) is %.4f\n' , u19 ) ;
fprintf( 'The imputation of player #20 (producer) is %.4f\n' , u20 ) ;
fprintf( 'The imputation of player #21 (producer) is %.4f\n' , u21 ) ;
fprintf( 'The imputation of player #22 (producer) is %.4f\n' , u22 ) ;
fprintf( 'The imputation of player #23 (producer) is %.4f\n' , u23 ) ;
fprintf( 'The imputation of player #24 (producer) is %.4f\n' , u24 ) ;
fprintf( 'The imputation of player #25 (producer) is %.4f\n' , u25 ) ;
fprintf( 'The imputation of player #26 (producer) is %.4f\n' , u26 ) ;
fprintf( 'The imputation of player #27 (producer) is %.4f\n' , u27 ) ;
fprintf( 'The imputation of player #28 (producer) is %.4f\n' , u28 ) ;
fprintf( 'The imputation of player #29 (producer) is %.4f\n' , u29 ) ;
fprintf( 'The imputation of player #30 (producer) is %.4f\n' , u30 ) ;
fprintf( 'The imputation of player #31 (producer) is %.4f\n' , u31 ) ;
fprintf( 'The imputation of player #32 (producer) is %.4f\n' , u32 ) ;
fprintf( 'The imputation of player #33 (producer) is %.4f\n' , u33 ) ;
fprintf( 'The imputation of player #34 (producer) is %.4f\n' , u34 ) ;
fprintf( 'The imputation of player #35 (producer) is %.4f\n' , u35 ) ;
fprintf( 'The imputation of player #36 (producer) is %.4f\n' , u36 ) ;
fprintf( 'The imputation of player #37 (producer) is %.4f\n' , u37 ) ;
fprintf( 'The imputation of player #38 (producer) is %.4f\n' , u38 ) ;
fprintf( 'The imputation of player #39 (producer) is %.4f\n' , u39 ) ;
fprintf( 'The imputation of player #40 (producer) is %.4f\n' , u40 ) ;
fprintf( 'The imputation of player #41 (producer) is %.4f\n' , u41 ) ;
fprintf( 'The imputation of player #42 (producer) is %.4f\n' , u42 ) ;
fprintf( 'The imputation of player #43 (producer) is %.4f\n' , u43 ) ;
fprintf( 'The imputation of player #44 (producer) is %.4f\n' , u44 ) ;
fprintf( 'The imputation of player #45 (producer) is %.4f\n' , u45 ) ;
fprintf( 'The imputation of player #46 (producer) is %.4f\n' , u46 ) ;
fprintf( 'The imputation of player #47 (producer) is %.4f\n' , u47 ) ;
fprintf( 'The imputation of player #48 (producer) is %.4f\n' , u48 ) ;
fprintf( 'The imputation of player #49 (producer) is %.4f\n' , u49 ) ;
fprintf( 'The imputation of player #50 (producer) is %.4f\n' , u50 ) ;
fprintf( 'The imputation of player #51 (consumer) is %.4f\n' , u51 ) ;
fprintf( 'The imputation of player #52 (consumer) is %.4f\n' , u52 ) ;
fprintf( 'The imputation of player #53 (consumer) is %.4f\n' , u53 ) ;
fprintf( 'The imputation of player #54 (consumer) is %.4f\n' , u54 ) ;
fprintf( 'The imputation of player #55 (consumer) is %.4f\n' , u55 ) ;
fprintf( 'The imputation of player #56 (consumer) is %.4f\n' , u56 ) ;
fprintf( 'The imputation of player #57 (consumer) is %.4f\n' , u57 ) ;
fprintf( 'The imputation of player #58 (consumer) is %.4f\n' , u58 ) ;
fprintf( 'The imputation of player #59 (consumer) is %.4f\n' , u59 ) ;
fprintf( 'The imputation of player #60 (consumer) is %.4f\n' , u60 ) ;
fprintf( 'The imputation of player #61 (consumer) is %.4f\n' , u61 ) ;
fprintf( 'The imputation of player #62 (consumer) is %.4f\n' , u62 ) ;
fprintf( 'The imputation of player #63 (consumer) is %.4f\n' , u63 ) ;
fprintf( 'The imputation of player #64 (consumer) is %.4f\n' , u64 ) ;
fprintf( 'The imputation of player #65 (consumer) is %.4f\n' , u65 ) ;
fprintf( 'The imputation of player #66 (consumer) is %.4f\n' , u66 ) ;
fprintf( 'The imputation of player #67 (consumer) is %.4f\n' , u67 ) ;
fprintf( 'The imputation of player #68 (consumer) is %.4f\n' , u68 ) ;
fprintf( 'The imputation of player #69 (consumer) is %.4f\n' , u69 ) ;
fprintf( 'The imputation of player #70 (consumer) is %.4f\n' , u70 ) ;
fprintf( 'The imputation of player #71 (consumer) is %.4f\n' , u71 ) ;
fprintf( 'The imputation of player #72 (consumer) is %.4f\n' , u72 ) ;
fprintf( 'The imputation of player #73 (consumer) is %.4f\n' , u73 ) ;
fprintf( 'The imputation of player #74 (consumer) is %.4f\n' , u74 ) ;
fprintf( 'The imputation of player #75 (consumer) is %.4f\n' , u75 ) ;
fprintf( 'The imputation of player #76 (consumer) is %.4f\n' , u76 ) ;
fprintf( 'The imputation of player #77 (consumer) is %.4f\n' , u77 ) ;
fprintf( 'The imputation of player #78 (consumer) is %.4f\n' , u78 ) ;
fprintf( 'The imputation of player #79 (consumer) is %.4f\n' , u79 ) ;
fprintf( 'The imputation of player #80 (consumer) is %.4f\n' , u80 ) ;
fprintf( 'The imputation of player #81 (consumer) is %.4f\n' , u81 ) ;
fprintf( 'The imputation of player #82 (consumer) is %.4f\n' , u82 ) ;
fprintf( 'The imputation of player #83 (consumer) is %.4f\n' , u83 ) ;
fprintf( 'The imputation of player #84 (consumer) is %.4f\n' , u84 ) ;
fprintf( 'The imputation of player #85 (consumer) is %.4f\n' , u85 ) ;
fprintf( 'The imputation of player #86 (consumer) is %.4f\n' , u86 ) ;
fprintf( 'The imputation of player #87 (consumer) is %.4f\n' , u87 ) ;
fprintf( 'The imputation of player #88 (consumer) is %.4f\n' , u88 ) ;
fprintf( 'The imputation of player #89 (consumer) is %.4f\n' , u89 ) ;
fprintf( 'The imputation of player #90 (consumer) is %.4f\n' , u90 ) ;
fprintf( 'The imputation of player #91 (consumer) is %.4f\n' , u91 ) ;
fprintf( 'The imputation of player #92 (consumer) is %.4f\n' , u92 ) ;
fprintf( 'The imputation of player #93 (consumer) is %.4f\n' , u93 ) ;
fprintf( 'The imputation of player #94 (consumer) is %.4f\n' , u94 ) ;
fprintf( 'The imputation of player #95 (consumer) is %.4f\n' , u95 ) ;
fprintf( 'The imputation of player #96 (consumer) is %.4f\n' , u96 ) ;
fprintf( 'The imputation of player #97 (consumer) is %.4f\n' , u97 ) ;
fprintf( 'The imputation of player #98 (consumer) is %.4f\n' , u98 ) ;
fprintf( 'The imputation of player #99 (consumer) is %.4f\n' , u99 ) ;
fprintf( 'The imputation of player #100 (consumer) is %.4f\n' , u100 ) ;
fprintf( 'These results show that the producers who with to sell the electricity with expensive price obtain few profits and the consumers who with to purchase the electricity with expensive price obtain large profits\n' ) ;
fprintf( 'Therefore, producers have incentives to sell electricity at a lower price, and consumers have incentives to purchase electricity at a higher price. This would be good for social.\n\n' ) ;

fprintf( 'The imputation of the line possessed by the power system operator is %.4f\n' , uline ) ;
if result.objval == ( u1 + u2 + u3 + u4 + u5 + u6 + u7 + u8 + u9 + u10 + u11 + u12 + u13 + u14 + u15 + u16 + u17 + u18 + u19 + u20 + u21 + u22 + u23 + u24 + u25 + u26 + u27 + u28 + u29 + u30 + u31 + u32 + u33 + u34 + u35 + u36 + u37 + u38 + u39 + u40 + u41 + u42 + u43 + u44 + u45 + u46 + u47 + u48 + u49 + u50 + u51 + u52 + u53 + u54 + u55 + u56 + u57 + u58 + u59 + u60 + u61 + u62 + u63 + u64 + u65 + u66 + u67 + u68 + u69 + u70 + u71 + u72 + u73 + u74 + u75 + u76 + u77 + u78 + u79 + u80 + u81 + u82 + u83 + u84 + u85 + u86 + u87 + u88 + u89 + u90 + u91 + u92 + u93 + u94 + u95 + u96 + u97 + u98 + u99 + u100 + uline )
    fprintf( 'The profit obtained by the cooperation is allocated to the players and the power system operator \n' )
    fprintf( 'The total group rationality is satisfied\n' ) ; 
end


