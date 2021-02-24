
run('Linearize.m')

% Weightmatrix
Q=diag([200 88 20 15 5 1 80 20]); %alpha beta gamma alpha_d beta_d gamma_d 
R=diag([1 1]); 

% Neu C_Matrix
C_LQI = [eye(2), zeros(2,4)];

% LQI_Regler
K_LQI= lqi(ss(A,B,C_LQI,[]),Q,R);
K_LQR = K_LQI(1:2,1:6);

% Vorfilter
Vorfilter = -inv(C_LQI*inv(A-B*K_LQR)*B);

% Neue Zustandsraumdarstellung
A_LQI=[A,zeros(6,2);-C_LQI,zeros(2,2)]; 
B_LQI=[B;zeros(2,2)];

% Eigenwerte des geschlossenen Kreises
EW = eig(A_LQI-B_LQI*K_LQI);

% Luenberg Beobachter
observer_poles=[-23 -23.1 -23.2 -23.3 -23.4 -23.5]; 
L=place(A',C', observer_poles); 
L=L'; 

