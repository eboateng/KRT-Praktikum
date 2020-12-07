clear all

% get all model parameters

run('helikopter')

syms alpha beta gamma alpha_d beta_d gamma_d  F_f F_b


alpha_dd = (1/theta_a) * (-cos(beta))*L2*sin(gamma)*(F_b+F_f);
beta_dd = (1/theta_b)  * cos(gamma)*L2*(F_b+F_f)-cos(beta)*(m*L1*g-M*L2*g);
gamma_dd = (1/theta_c ) * 0.5*L3*(F_f-F_b);


x = [alpha; beta; gamma; alpha_d; beta_d; gamma_d];
x_d = [alpha_d; beta_d; gamma_d; alpha_dd; beta_dd; gamma_dd];



%stationary point x_s
alpha_s = 0;
beta_s = -7.5*pi/180; % initial elevation is offset
gamma_s = 0;
x_s = [alpha_s beta_s gamma_s 0 0 0];
dx_s = subs(x_d,[alpha,beta,gamma,alpha_d,beta_d,gamma_d],x_s);
%stationary point u_s
u_s = zeros(2,1);
u_s(1)=solve(dx_s).F_f;
u_s(2)=solve(dx_s).F_b; 


%Solve for numerical values for the equations
theta_a = double(subs(theta_a)); 
theta_b = double(subs(theta_a));
theta_c = double(subs(theta_c));
alpha_dd = vpa(subs(alpha_dd));
beta_dd = vpa(subs(beta_dd));
gamma_dd = vpa(subs(gamma_dd));


%Linearization and State space system
A_mat = jacobian(x_d, x);
B_mat = jacobian(x_d, [F_f, F_b]);
C = [eye(3),zeros(3,3)];
D = zeros(3,2);

A = double(subs(A_mat,[alpha,beta,gamma,F_f,F_b],[x_s(1:3),u_s(1),u_s(2)]));
B = double(subs(B_mat,[alpha,beta,gamma],x_s(1:3)));

plant = ss(A,B,C,D);

%Check stability of the system
Eig_A = eig(A);
if sign(Eig_A) > 0
    warning("Eigenvalues of A matrix indicate instability")
else
end

% Check Observability
rank_=rank(obsv(plant)); 
%%%% Controllability
rank_W=rank(ctrb(plant)); 

