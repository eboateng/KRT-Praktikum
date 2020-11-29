clear all

syms theta_a theta_b theta_c alpha beta gamma alpha_d beta_d gamma_d ...
    L1 L2 L3 F_b F_f M m g alpha_dd beta_dd gamma_dd


theta_a = m*L1^2 + M*L2^2;
theta_b = theta_a;
theta_c = (m*(0.5*L3)^2)/6;

alpha_dd = (1/theta_a) * (-cos(beta))*L2*sin(gamma)*(F_b+F_f);
beta_dd = (1/theta_b)  * cos(gamma)*L2*(F_b+F_f)-cos(beta)*(m*L1-M*L2)*g;
gamma_dd = (1/theta_c ) * 0.5*L3*(F_f-F_b);


x = [alpha; beta; gamma; alpha_d; beta_d; gamma_d];
x_d = [alpha_d beta_d gamma_d alpha_dd beta_dd gamma_dd]';

% Solve the equations
run('helikopter')

%Solve for numerical values for the equations
theta_a = vpa(theta_a)); 
theta_b = vpa(theta_a);
theta_c = vpa(theta_c));
alpha_dd = vpa(alpha_dd);
beta_dd = vpa(beta_dd);
gamma_dd = vpa(gamma_dd);


%Linearization and State space system
A = jacobian(x_d, x);
B = jacobian(x_d, [F_f, F_b]);
%C = ;
D = zeros(size(B))

%plant = ss(A,B,C,D);

%Assume Travel, pitch, elevation begin at 0
alpha = 0;
beta = 0;
gamma = 0;

%Check stability of the system
Eig_A = eig(vpa(subs(A)));
if sign(Eig_A) > 0
    warning("Eigenvalues of A matrix indicate instability")
else
end
    