clear;
%?u???b?N“??D?É?æ?é?}?C?N???O???b?h?Ô?Ì“d—Í?æ?ø(EPEC-MILP???f??)

%MG?”3
%?u???b?N?”100?iOfferSetteing.m?j
%????“??D?Ì???ð•Ï?”

%?iMGPTmain.m   3Blocks  ?¨?@?@MGPTmain2.m  100Blocks?j

%% -----------------’è?”----------------- %%

%-------------?W??-------------%

MG = 3;
Block = 100;
Gen  =100;
Con = 100;



%---“??D??’è?iOfferSetteing.m?Å??’è?µ?½?f?[?^?ð“Ç???????j---%

BidPriceGen  = xlsread('BidPriceGen.xlsx');
BidPriceCon  = xlsread('BidPriceCon.xlsx');
% BidVolumeGen = xlsread('BidVolumeGen.xlsx');
% BidVolumeCon = xlsread('BidVolumeCon.xlsx');
BidVolumeGen = xlsread('GenAccommodatable.xlsx');
BidVolumeCon = xlsread('ConAccommodatable.xlsx');


%-------?n“??Ö?A?p?????[?^-------%

B = [100 100 100];      %???H?T?Z?v?^?“?X
Pmax = [50 50 50];      %‘—“d—e—Ê
Line = 3;   %???C?“?”



%--------???`?»?p?????[?^--------%
muSDTv = 5;
M=1.0e+7; 






%% ---------------------------•Ï?”----------------------------- %%


%-------------------------•Ï?””Ô??------------------------%

%%--------??’è•Ï?”-------%%
CG = 1;
G = CG + MG*Block;
D = G + MG*Block;
theta = D + MG*Block;

%%-------‘o‘Î•Ï?”-------%%
LMP = theta + MG;
rhotheta = LMP + MG;
rhoGmin = rhotheta + 1;
rhoDmin = rhoGmin + MG*Block;
rhoLmin = rhoDmin + MG*Block;

rhoGmax = rhoLmin + Line;
rhoDmax = rhoGmax + MG*Block;
rhoLmax = rhoDmax + MG*Block;

%%---???O???“?W?…?æ?”?i“??®?§–ñ?j---%%
muPB = rhoLmax + Line;
muG = muPB + MG;
muD = muG + MG*Block;
muL = muD + MG*Block;
mutheta = muL + Line;
muSDT = mutheta + 1;

%%--???O???“?W?…?æ?”?i•s“??®?§–ñ?j--%%
phiCGmin = muSDT + 1;
phiGmin = phiCGmin + MG*Block;
phiDmin = phiGmin + MG*Block;
phiLmin = phiDmin + MG*Block;

phiCGmax = phiLmin + Line;
phiGmax = phiCGmax + MG*Block;
phiDmax = phiGmax + MG*Block;
phiLmax = phiDmax + MG*Block;

%%---???O???“?W?…?æ?”?i‘o‘Î•Ï?””ñ•??§–ñ?j---%%
etaGmin = phiLmax + Line;
etaDmin = etaGmin + MG*Block;
etaLmin = etaDmin + MG*Block;

etaGmax = etaLmin + Line;
etaDmax = etaGmax + MG*Block;
etaLmax = etaDmax + MG*Block;

%%----------?o?C?i??•Ï?”----------%%
uCGmin = etaLmax + Line;
uGmin = uCGmin + MG*Block;
uDmin = uGmin + MG*Block;
uLmin = uDmin + MG*Block;

uCGmax = uLmin + Line;
uGmax = uCGmax + MG*Block;
uDmax = uGmax + MG*Block;
uLmax = uDmax + MG*Block;


uetaGmin = uLmax + Line;
uetaDmin = uetaGmin + MG*Block;
uetaLmin = uetaDmin + MG*Block;
uetaGmax = uetaLmin + Line;
uetaDmax = uetaGmax + MG*Block;
uetaLmax = uetaDmax + MG*Block;

%dual KKT equality
uuGmin = uetaLmax + Line;
uuDmin = uuGmin + MG*Block;
uuLmin = uuDmin + MG*Block;
uuGmax = uuLmin + Line;
uuDmax = uuGmax + MG*Block;
uuLmax = uuDmax + MG*Block;




%------------------------•Ï?”?”---------------------------%
NumVarC = etaLmax + Line - 1;              %?A‘±•Ï?”
NumVarB = uuLmax + Line - 1 - NumVarC;   %?o?C?i??•Ï?”
NumVar = NumVarC + NumVarB;     %‘?•Ï?”



%-----------------------?ã?º?À’l---------------------------%
ub = Inf*ones(NumVar, 1);

for i = 1 : MG
    for b = 1 : Gen%=Con
        Z = Gen*(i-1) + b;
        ub(G-1 + Z) = BidVolumeGen(i, b);
        ub(D-1 + Z) = BidVolumeCon(i, b);
    end
end


lb = zeros(NumVar, 1);

for i = 1 : MG
    for b = 1 : Gen
        Z = Gen*(i-1) + b;
        lb(CG-1 + Z) = BidPriceGen(i,b);
    end
end

lb(theta:theta+1) = -Inf;
lb(muPB : muSDT) = -Inf;






%% -----------------------–Ú“I?Ö?”----------------------------- %%
f = zeros(NumVar, 1);

%?Ð?ï?ú?¶
for i = 1 : MG
    for b = 1 : Gen%=Con
        Z = Gen*(i-1) + b;
        f(G-1 + Z) = BidPriceGen(i, b);
        f(D-1 + Z) = -BidPriceCon(i, b);

    end
end


% % ’ª—¬—Ê
% f(theta) = B(1);    f(theta+1) =-B(1); 
% f(theta+1) = B(2);    f(theta+2) = -B(2);
% f(theta+2) = B(3);    f(theta) = -B(3);


% ---min?¨1, max?¨2---%
modelsense = 1;



%% -----------------------“??®?§–ñ----------------------------- %%
NumAeq =  2719;%4*MG + MG*Block*10 -2;

Aeq = zeros(NumAeq, NumVar);
beq = zeros(NumAeq, 1);


eqNum = 0;

%-----------------------?ù???o???“?X----------------------%
%%(76)
for i = 1 : MG
    for b = 1 : Gen%=Con
        Z = Gen*(i-1) + b;
        Aeq(eqNum + i, G-1 + Z) = 1;
        Aeq(eqNum + i, D-1 + Z) = -1;
    end
    beq(eqNum + i) = 0;
end

Aeq(1, theta) = -B(1)-B(3); Aeq(1, theta+1) = B(1); Aeq(1, theta+2) = B(3);
Aeq(2, theta) = B(1); Aeq(2, theta+1) = -B(1)-B(2); Aeq(2, theta+2) = B(2);
Aeq(3, theta) = B(3); Aeq(3, theta+1) = B(2); Aeq(3, theta+2) = -B(2)-B(3);





eqNum = eqNum + MG;

%------------------------‘o‘Î?§–ñ-----------------------%
%%(77)
for i = 1 : MG
    for b = 1 : Gen
        Z = Gen*(i-1) + b;
        Aeq(eqNum + Z, CG-1 + Z) = 1;
        Aeq(eqNum + Z, LMP-1 + i) = -1;
        Aeq(eqNum + Z, rhoGmin-1 + Z) = -1;
        Aeq(eqNum + Z, rhoGmax-1 + Z) = 1;
        
        beq(eqNum + Z) = 0;
    end
end




eqNum = eqNum + MG*Block;

%%(78)       
for i = 1 : MG
    for b = 1 : Con
        Z = Con*(i-1) + b;
        Aeq(eqNum + Z, LMP-1 + i) = 1;
        Aeq(eqNum + Z, rhoDmin-1 + Z) = -1;
        Aeq(eqNum + Z, rhoDmax-1 + Z) = 1;
        
        beq(eqNum + Z) = BidPriceCon(i, b);
    end
end





eqNum = eqNum + MG*Block;

%%(79)  
Aeq(eqNum+1, LMP) = -B(1)-B(3); Aeq(eqNum+1, LMP+1) = B(1); Aeq(eqNum+1, LMP+2) = B(3);
Aeq(eqNum+2, LMP) = B(1); Aeq(eqNum+2, LMP+1) = -B(1)-B(2); Aeq(eqNum+2, LMP+2) = B(2);
Aeq(eqNum+3, LMP) = B(3); Aeq(eqNum+3, LMP+1) = B(2); Aeq(eqNum+3, LMP+2) = -B(2)-B(3);

Aeq(eqNum+1, rhoLmin) = B(1);Aeq(eqNum+1, rhoLmin+2) = -B(3);
Aeq(eqNum+1, rhoLmax) = -B(1);Aeq(eqNum+1, rhoLmax+2) = B(3);
Aeq(eqNum+2, rhoLmin) = -B(1);Aeq(eqNum+2, rhoLmin+1) = B(2);
Aeq(eqNum+2, rhoLmax) = B(1);Aeq(eqNum+2, rhoLmax+1) = -B(2);
Aeq(eqNum+3, rhoLmin+1) = -B(2);Aeq(eqNum+3, rhoLmin+2) = B(3);
Aeq(eqNum+3, rhoLmax+1) = B(2);Aeq(eqNum+3, rhoLmax+2) = -B(3);
Aeq(eqNum+3, rhotheta) = 1;


beq(eqNum + 1) = 0;
beq(eqNum + 2) = 0;
beq(eqNum + 3) = 0;
        





eqNum = eqNum + MG;

%------------------------KKT?ð??-------------------------%
%(80)CG
for i = 1 : MG
    for b = 1 : Gen
        Z = Gen*(i-1) + b;
        Aeq(eqNum + Z, G-1 + Z) = muSDTv;
        Aeq(eqNum + Z, muG-1 + Z) = 1;
        Aeq(eqNum + Z, phiCGmin-1 + Z) = -1;
        if b ~= Gen
            Aeq(eqNum + Z, phiCGmax-1 + Z) = 1;
        end
        if b ~= 1
            Aeq(eqNum + Z, phiCGmax-1 + Z-1) = -1;
        end
        
        beq(eqNum + Z) = 0;
    end
end

eqNum = eqNum + MG*Gen;

%(82)G
for i = 1 : MG
     for b = 1 : Gen
         Z = Gen*(i-1) + b;
         Aeq(eqNum + Z, LMP-1 + i) = -1;
         Aeq(eqNum + Z, CG-1 + Z) = muSDTv;
         Aeq(eqNum + Z, muPB-1 + i) = 1;
         Aeq(eqNum + Z, phiGmin-1 + Z) = -1;
         Aeq(eqNum + Z, phiGmax-1 + Z) = 1;
         
         beq(eqNum + Z) = -BidPriceGen(i, b);
     end
end
         
 eqNum = eqNum + MG*Gen;

%(83)D
for i = 1 : MG
     for b = 1 : Con
         Z = Con*(i-1) + b;
         Aeq(eqNum + Z, muPB-1 + i) = -1;
         Aeq(eqNum + Z, phiDmin-1 + Z) = -1;
         Aeq(eqNum + Z, phiDmax-1 + Z) = 1;
         
         beq(eqNum + Z) = muSDTv*BidPriceCon(i, b);
     end
end        
         
eqNum = eqNum + MG*Con;


%(84)theta

Aeq(eqNum + 1, muPB) = -B(1)-B(3); Aeq(eqNum + 1, muPB + 1) = B(1); Aeq(eqNum + 1, muPB + 2) = B(3);
Aeq(eqNum+1, phiLmin) = -B(1); Aeq(eqNum+1, phiLmin+2) = B(3);
Aeq(eqNum+1, phiLmax) = B(1); Aeq(eqNum+1, phiLmax+2) = -B(3);
    

Aeq(eqNum+2, muPB) = B(1); Aeq(eqNum+2, muPB+1) = -B(1)-B(2); Aeq(eqNum+2, muPB+2) = B(2);
Aeq(eqNum+2, phiLmin) = B(1);Aeq(eqNum+2, phiLmin+1) = -B(2);
Aeq(eqNum+2, phiLmax) = -B(1);Aeq(eqNum+2, phiLmax+1) = B(2);


Aeq(eqNum+3, muPB) = B(3); Aeq(eqNum+3, muPB+1) = B(2); Aeq(eqNum+3, muPB+2) = -B(2)-B(3);
Aeq(eqNum+3, phiLmin+1) = B(2);Aeq(eqNum+3, phiLmin+2) = -B(3);
Aeq(eqNum+3, phiLmax+1) = -B(2);Aeq(eqNum+3, phiLmax+2) = B(3);
Aeq(eqNum+3, mutheta) = 1;

beq(eqNum + 1) = 0;
beq(eqNum + 2) = 0;
beq(eqNum + 3) = 0;

    
eqNum = eqNum + MG;   



% (85)LMP
for i = 1 : MG
    for b = 1 : Block
        Z = Block*(i-1) + b;
        Aeq(eqNum + i, G-1 + Z) = -1;
        Aeq(eqNum + i, muG-1 + Z) = -1;
        Aeq(eqNum + i, muD-1 + Z) = 1;
    end
    beq(eqNum + i) = 0;
end

Aeq(eqNum + 1, muL) = -B(1)-B(3); Aeq(eqNum + 1, muL + 1) = B(1); Aeq(eqNum + 1, muL + 2) = B(3);
Aeq(eqNum+2, muL) = B(1); Aeq(eqNum+2, muL+1) = -B(1)-B(2); Aeq(eqNum+2, muL+2) = B(2);
Aeq(eqNum+3, muL) = B(3); Aeq(eqNum+3, muL+1) = B(2); Aeq(eqNum+3, muL+2) = -B(2)-B(3);


eqNum = eqNum + MG;   

%?Âr
Aeq(eqNum+1, muL+2) = 1;   beq(eqNum+1) = 0;
    
    
eqNum = eqNum + 1;   

%(86)‘o‘Î?§–ñ”ñ•?
for i = 1 : MG
    for b = 1 : Gen
        Z = Gen*(i-1) + b;
        Aeq(eqNum + Z, muG-1 +Z) = -1;
        Aeq(eqNum + Z, etaGmin-1 + Z) = -1;
        
        beq(eqNum + Z) = 0;
    end
end

eqNum = eqNum + MG*Gen;   

%(87)
for i = 1 : MG
    for b = 1 : Gen
        Z = Gen*(i-1) + b;
        Aeq(eqNum + Z, muG-1 +Z) = 1;
        Aeq(eqNum + Z, etaGmax-1 + Z) = -1;
        
        beq(eqNum + Z) = -muSDTv*(BidVolumeGen(i, b));
    end
end

eqNum = eqNum + MG*Gen;   

%(88)
for i = 1 : MG
    for b = 1 : Con
        Z = Con*(i-1) + b;
        Aeq(eqNum + Z, muD-1 + Z) = -1;
        Aeq(eqNum + Z, etaDmin-1 + Z) = -1;
        
        beq(eqNum + Z) = 0;
    end
end

eqNum = eqNum + MG*Con;   

%(89)
for i = 1 : MG
    for b = 1 : Con
        Z = Con*(i-1) + b;
        Aeq(eqNum +Z, muD-1 + Z) = 1;
        Aeq(eqNum + Z, etaDmax-1 + Z) = -1;
        
        beq(eqNum +Z) = -muSDTv*(BidVolumeCon(i, b));
    end
end

eqNum = eqNum + MG*Con;   


% (90)(91)
Aeq(eqNum + 1, muL) = B(1);   Aeq(eqNum + 1, muL+1) = -B(1);   
Aeq(eqNum + 1, etaLmin) = -1;
beq(eqNum + 1) = -muSDTv*Pmax(1);

Aeq(eqNum + 2, muL+1) = B(2);   Aeq(eqNum + 2, muL+2) = -B(2);   
Aeq(eqNum + 2, etaLmin+1) = -1;
beq(eqNum + 2) = -muSDTv*Pmax(2);

Aeq(eqNum + 3, muL+2) = B(3);   Aeq(eqNum + 3, muL) = -B(3);   
Aeq(eqNum + 3, etaLmin+2) = -1;
beq(eqNum + 3) = -muSDTv*Pmax(3);


eqNum = eqNum + MG;

Aeq(eqNum + 1, muL) = -B(1);   Aeq(eqNum + 1, muL+1) = B(1);   
Aeq(eqNum + 1, etaLmax) = -1;
beq(eqNum + 1) = -muSDTv*Pmax(1);

Aeq(eqNum + 2, muL+1) = -B(2);   Aeq(eqNum + 2, muL+2) = B(2);   
Aeq(eqNum + 2, etaLmax+1) = -1;
beq(eqNum + 2) = -muSDTv*Pmax(2);

Aeq(eqNum + 3, muL+2) = -B(3);   Aeq(eqNum + 3, muL) = B(3);   
Aeq(eqNum + 3, etaLmax+2) = -1;
beq(eqNum + 3) = -muSDTv*Pmax(3);








eqNum = eqNum + 3;


    
%% -----------------------•s“??®?§–ñ---------------------------- %%
NumAin = 8736;%NumVarB + 8*N*B + 2 + NumVarC - etaGmin + 1

Ain = zeros(NumAin, NumVar);
bin = zeros(NumAin, 1);



inNum = 0;

%---------------?ã?Ê?§–ñ(2)(3)---------------%
for i = 1 : MG
    for b = 1 : Block-1
    Ain(inNum + (Block-1)*(i-1) + b, CG-1 + Block*(i-1) + b) = 1;
    Ain(inNum + (Block-1)*(i-1) + b, CG-1 + Block*(i-1) + b+1) = -1;
    bin(inNum + (Block-1)*(i-1) + b) = 0;
    end
end

inNum = inNum + MG*(Block-1);



% -------0<phi<Mu-----------%
for i = 1 : uCGmin - phiCGmin 
    Ain(inNum+i, phiCGmin-1 + i) = 1;
    Ain(inNum+i, uCGmin-1 + i) = -M;
    
    bin(i) = 0;
end






inNum = inNum+i;


% ------0<Var<M(1-u)--------%
%(92)-(101)
%---min---%
for i = 1 : theta-1
    Ain(inNum + i, i) = 1;
    Ain(inNum + i, uCGmin-1 + i) = M;
    
    bin(inNum + i) = M;
end

%CG
    for j = 1 : MG
        for b = 1 : Block
            bin(inNum + Block*(j-1) + b) = M + BidPriceGen(j, b);
        end
    end
    
    
inNum = inNum + i;

    
%L
Ain(inNum + 1, theta) = B(1);   Ain(inNum + 1, theta+1) = -B(1);
Ain(inNum + 1, uLmin) = M;      bin(inNum + 1) = M - Pmax(1);

Ain(inNum + 2, theta+1) = B(2);   Ain(inNum + 2, theta+2) = -B(2);
Ain(inNum + 2, uLmin+1) = M;      bin(inNum + 2) = M - Pmax(2);

Ain(inNum + 3, theta+2) = B(3);   Ain(inNum + 3, theta) = -B(3);
Ain(inNum + 3, uLmin+2) = M;      bin(inNum + 3) = M - Pmax(3);

inNum = inNum + MG;








%---max---%


%%----“??D?R?X?g?ã?À-----%
%---????---%
for i = 1 : MG
    for b = 1 : Block-1
        Z = (Block-1)*(i-1) + b;
        Y = Block*(i-1) + b;
        Ain(inNum + Z, CG-1 + Y) = -1; Ain(inNum + Z, CG-1 + Y+1) = 1;
        Ain(inNum + Z, uCGmax-1 + Y) = M;

        bin(inNum + Z) = M;
    end
end

inNum = inNum + MG*(Block-1);




%max%
for i = 1 : LMP-G
    Ain(inNum + i, G-1 + i) = -1;
    Ain(inNum + i, uGmax-1 + i) = M;
    
    bin(inNum + i) = M;
end

%------–ñ’è—Ê?ã?À--------%
for i = 1 : MG
    for b = 1 : Block
        bin(inNum + Block*(i-1) + b) = M - BidVolumeGen(i, b);
    end
end

inNum = inNum + MG*Block;
for i = 1 : MG
    for b = 1 : Block
        bin(inNum + Block*(i-1) + b) = M - BidVolumeCon(i, b);
    end
end

inNum = inNum + MG*Block;

%------‘—“d—e—Ê------%
%L
Ain(inNum + 1, theta) = -B(1);   Ain(inNum + 1, theta+1) = B(1);
Ain(inNum + 1, uLmax) = M;      bin(inNum + 1) = M - Pmax(1);

Ain(inNum + 2, theta+1) = -B(2);   Ain(inNum + 2, theta+2) = B(2);
Ain(inNum + 2, uLmax+1) = M;      bin(inNum + 2) = M - Pmax(2);

Ain(inNum + 3, theta+2) = -B(3);   Ain(inNum + 3, theta) = B(3);
Ain(inNum + 3, uLmax+2) = M;      bin(inNum + 3) = M - Pmax(3);

inNum = inNum + MG;






%(102)-(107)

for i = 1 : muPB - rhoGmin
    Ain(inNum + i, rhoGmin-1 + i) = 1;
    Ain(inNum + i, uetaGmin-1 + i) = M;
    
    bin(inNum + i) = M;
end
    

inNum = inNum + i;





%-------?­‘o‘Î’è—?’u?«?·?¦(‘o‘Î•Ï?”?Æ?º?Ê–â‘è??’è•Ï?”?Ì‘?•â?ð??)-------%

% -------0<rho<Mu-----------%
for i = 1 : muPB - rhoGmin
    Ain(inNum + i, rhoGmin-1 + i) = 1;
    Ain(inNum + i, uuGmin-1 + i) = -M;
    
    bin(inNum + i) = 0;
end

inNum = inNum + i;


% ------0<Var<M(1-u)--------%

%---min---%
for i = 1 : theta-G
    Ain(inNum + i, G-1 + i) = 1;
    Ain(inNum + i, uuGmin-1 + i) = M;
    
    bin(inNum + i) = M;
end
    
inNum = inNum + i;

  
%L
Ain(inNum + 1, theta) = B(1);   Ain(inNum + 1, theta+1) = -B(1);
Ain(inNum + 1, uuLmin) = M;      bin(inNum + 1) = M - Pmax(1);

Ain(inNum + 2, theta+1) = B(2);   Ain(inNum + 2, theta+2) = -B(2);
Ain(inNum + 2, uuLmin+1) = M;      bin(inNum + 2) = M - Pmax(2);

Ain(inNum + 3, theta+2) = B(3);   Ain(inNum + 3, theta) = -B(3);
Ain(inNum + 3, uuLmin+2) = M;      bin(inNum + 3) = M - Pmax(3);

inNum = inNum + MG;  
    
    
    




%---max---%
for i = 1 : theta-G
    Ain(inNum + i, G-1 + i) = -1;
    Ain(inNum + i, uuGmax-1 + i) = M;
    
    bin(inNum + i) = M;
end


%------–ñ’è—Ê?ã?À--------%

for i = 1 : MG
    for b = 1 : Block
        bin(inNum + Block*(i-1) + b) = M - BidVolumeGen(i, b);
    end
end

inNum = inNum + MG*Block;
for i = 1 : MG
    for b = 1 : Block
        bin(inNum + Block*(i-1) + b) = M - BidVolumeCon(i, b);
    end
end



inNum = inNum + MG*Block;

%------‘—“d—e—Ê------%


Ain(inNum + 1, theta) = -B(1);   Ain(inNum + 1, theta+1) = B(1);
Ain(inNum + 1, uuLmax) = M;      bin(inNum + 1) = M - Pmax(1);

Ain(inNum + 2, theta+1) = -B(2);   Ain(inNum + 2, theta+2) = B(2);
Ain(inNum + 2, uuLmax+1) = M;      bin(inNum + 2) = M - Pmax(2);

Ain(inNum + 3, theta+2) = -B(3);   Ain(inNum + 3, theta) = B(3);
Ain(inNum + 3, uuLmax+2) = M;      bin(inNum + 3) = M - Pmax(3);




inNum = inNum + Line;


%‘—“d—e—Ê?å?§–ñ

Ain(inNum + 1, theta) = -B(1);  Ain(inNum + 1, theta+1) = B(1);
bin(inNum + 1) = Pmax(1);

Ain(inNum + 2, theta+1) = -B(2);  Ain(inNum + 2, theta+2) = B(2);
bin(inNum + 2) = Pmax(2);

Ain(inNum + 3, theta+2) = -B(3);  Ain(inNum + 3, theta) = B(3);
bin(inNum + 3) = Pmax(3);


inNum = inNum + Line;

Ain(inNum + 1, theta) = B(1);  Ain(inNum + 1, theta+1) = -B(1);
bin(inNum + 1) = Pmax(1);

Ain(inNum + 2, theta+1) = B(2);  Ain(inNum + 2, theta+2) = -B(2);
bin(inNum + 2) = Pmax(2);

Ain(inNum + 3, theta+2) = B(3);  Ain(inNum + 3, theta) = -B(3);
bin(inNum + 3) = Pmax(3);

%% --------------------Gurobi Optimizer------------------------%%

clear model;
model.obj = f;
model.A = sparse([Aeq; Ain]); 
model.rhs =[beq; bin];
model.sense = [repmat('=', size(Aeq, 1), 1); repmat('<', size(Ain, 1), 1)];
model.ub = ub;
model.lb = lb;

for r = 1 : NumVarC
    model.vtype( r ) = 'C' ;
end
for r =  uCGmin : NumVar
   model.vtype( r ) = 'B' ;
end



model.modelsense = 'min';

if modelsense == 1
    model.modelsense = 'min';
elseif modelsense == 2
    model.modelsense = 'max';
end



clear params;
params.outputflag = 0;
result=gurobi(model,params);
% disp(result);
    
x=result.x;

xlswrite('x.xlsx', x);





%% ---???Ê?®—?--- %%


g = zeros(MG);
d = zeros(MG);
P = zeros(Line);
Pro = zeros(MG);

for i = 1 : MG
    for b = 1 : Block
        g(i) = g(i) + x(G-1 + Block*(i-1) + b);
        d(i) = d(i) + x(D-1 + Block*(i-1) + b);
    end
end

P(1) = B(1)*( x(theta) - x(theta+1) );
P(2) = B(2)*( x(theta+1) - x(theta+2) );
P(3) = B(3)*( x(theta+2) - x(theta) );

for i = 1 : MG
    for b = 1 : Block
        Pro(i) = Pro(i) + ( x(LMP-1 + i) - BidPriceGen(i,b) ) * x(G-1 + Block*(i-1) + b); 
    end
end


SW1 = 0;
for i = 1 : MG
    for b = 1 : Block
        SW1 = SW1 + (x(LMP-1 + i) - BidPriceGen(i, b))*x(G-1 + Block*(i-1) + b) - (x(LMP-1 + i) - BidPriceCon(i, b))*x(D-1 + Block*(i-1) + b);
    end
end

SW2 = 0;
for i = 1 : MG
    for b = 1 : Block
        SW2 = SW2 + (-BidPriceGen(i, b))*x(G-1 + Block*(i-1) + b) + (BidPriceCon(i, b))*x(D-1 + Block*(i-1) + b);
    end
end





    
fprintf('”­“d—Ê: ');

for i = 1 : MG
    fprintf('g%d: %.1f ',i,g(i));
end

fprintf('?ù—v—Ê: ');

for i = 1 : MG
    fprintf('d%d: %.1f ',i,d(i));
end

fprintf('\n’ª—¬—Ê: ');

for i = 1 : Line
    fprintf('L%d: %.1f  ',i,P(i));
end

fprintf('\n?¿?i  : ');

for i = 1 : MG
    fprintf('LMP%d: %.1f ',i,x(LMP-1+i));
end

fprintf('\n—??v  : ');

for i = 1 : MG
    fprintf('Pro%d: %.1f ',i,Pro(i));
end

fprintf('\n?Ð?ï?ú?¶: ');

fprintf('%.1f, %.1f',SW1,SW2);

fprintf('–Ú“I?Ö?” : %.1f\n\n',result.objval);
  

