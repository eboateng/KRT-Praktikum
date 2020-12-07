run('Linearize.m')

p=size(3,1);                    % no. of outputs (y)
[n,m]=size(B);                  % no. of states nd inputs (u)
Znm=zeros(n,m); Zmm=zeros(m,m); 
Znn=zeros(n,n); Zmn=zeros(m,n);
% 1) Design a state feedback controller
A_aug=[A Znm; -C Zmm]; B_aug=[B;-D];    % augment plant with integrators
Q=[Znn Znm; Zmn eye(m,m)];      % weight on integrated error
R=eye(m);                       % input weight
Kr=lqr(A,B,Q,R);  