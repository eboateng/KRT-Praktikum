run('Linearize.m')

p=size(3,1);                    % no. of outputs (y)
[n,z]=size(B);                  % no. of states nd inputs (u)(6,2)
F=zeros(n,z); T=zeros(z,z); 
W=zeros(n,n); H=zeros(z,n);
% 1) Design a state feedback controller
%A_aug=[A F; -C T]; 
%B_aug=[B;-D];                   % augment plant with integrators
Q_I=eye(9);             % weight on integrated error
Q=eye(n);
R=eye(z);                       % input weight
[Kr,P,EW]=lqr(A,B,Q,R);
[Kr_I,P_I,EW_I] = lqi(plant,Q_I,R,0);

u = -Kr*x;
