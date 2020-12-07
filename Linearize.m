clear all

syms theta_a theta_b theta_c alpha beta gamma alpha_d beta_d gamma_d ...
    L1 L2 L3 F_b F_f M m g alpha_dd beta_dd gamma_dd


theta_a = m*L1^2 + M*L2^2;
theta_b = theta_a;
theta_c = (m*(0.5*L3)^2)/6;

alpha_dd = (1/theta_a) * (-cos(beta))*L2*sin(gamma)*(F_b+F_f);
beta_dd = (1/theta_b)  * (cos(gamma)*L2*(F_b+F_f)-cos(beta)*(m*g*L1-M*g*L2));
gamma_dd = (1/theta_c ) * 0.5*L3*(F_f-F_b);


x = [alpha; beta; gamma; alpha_d; beta_d; gamma_d];
x_d = [alpha_d beta_d gamma_d alpha_dd beta_dd gamma_dd]';

% Solve the equations
run('helikopter')

%Assume Travel, pitch, elevation begin at 0
%operating points
alpha_op = 0;
beta_op = -27.5*pi/180; % initial elevation is offset
gamma_op = 0;

x_op= [alpha_op,beta_op,gamma_op,0,0,0];


%Solve for numerical values for the equations
theta_a = double(subs(theta_a)); 
theta_b = double(subs(theta_a));
theta_c = double(subs(theta_c));
alpha_dd = vpa(subs(alpha_dd));
beta_dd = vpa(subs(beta_dd));
gamma_dd = vpa(subs(gamma_dd));

%Linearization and State space system
A_mat = jacobian(x_d, x)
B_mat = jacobian(x_d, [F_f, F_b])
C = [eye(3); zeros(3,3)]';
D = zeros(size(3,2));

[F_f, F_b] = model_voltage();

%Linearization about the operating point. Substituting variables
A_lin = vpa((subs(A_mat,[alpha,beta,gamma,F_f,F_b],[x_op(1:3),F_f,F_b])))
B_lin = vpa((subs(B_mat,[alpha,beta,gamma],x_op(1:3))))

A = double(subs(A_lin))
B = double(subs(B_lin))


plant = ss(A,B,C,D);

%Check stability of the system
Eig_A = eig(A);
if sign(Eig_A) > 0
    warning("Eigenvalues of A matrix indicate instability")
else
end

% Check Observability
%O_0 = obsv(A,C)
O_1 = obsv(plant)
rg_O=rank(obsv(plant));

% Controllability
%C_0 = ctrb(A,B)
C_1= ctrb(plant) 
rg_Z=rank(ctrb(plant)) 
    