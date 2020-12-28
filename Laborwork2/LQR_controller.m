run('Linearize.m')

% Parameter of the LQI_Controller

Q_LQI=eye(8);             % weight on integrated error
%Q=eye(n);
R=eye(2);                       % input weight
C_LQI = [eye(2), zeros(2,4)];
%[K_LQR,P,EW]=lqr(A,B,Q,R);
[K_LQI,P_I,EW_I] = lqi(ss(A,B,C_LQI,[]),Q_LQI,R);
K_LQR = K_LQI(1:2,1:6);
Vorfilter = -inv(C_LQI*inv(A-B*K_LQR)*B);
EW = eig(A-B*K_LQR);

% Oberserver
observer_poles=[-10 -10 -20 -20 -30 -30]; 
L=place(A',C', observer_poles); 
L=L'; 
