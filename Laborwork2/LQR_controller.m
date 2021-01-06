run('Linearize.m')

% Parameter of the LQI_Controller


Q=eye(8);             
R=eye(2);                       
C_LQI = [eye(2), zeros(2,4)];
K_LQI = lqi(ss(A,B,C_LQI,[]),Q,R);
K_LQR = K_LQI(1:2,1:6);

% Vorfilter
Vorfilter = -inv(C_LQI*inv(A-B*K_LQR)*B);

% Neue Zustandsraumdarstellung
A_LQI=[A,zeros(6,2);-C_LQI,zeros(2,2)]; 
B_LQI=[B;zeros(2,2)];

% Eigenwerte des geschlossenen Kreises
EW = eig(A_LQI-B_LQI*K_LQI);

% Oberserver
observer_poles=[-20 -21 -22 -23 -24 -25]; 
L=place(A',C', observer_poles); 
L=L'; 
