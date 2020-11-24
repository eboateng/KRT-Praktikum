run('helikopter')

u = [F_f;F_b]

Theta_a * alpha_ddot = (-cos(beta))*L2*sin(gamma)*(F_b+F_f);
Theta_b * beta_ddot = cos(gamma)*L2*(F_b+F_f)-cos(beta)*(m*L1-M*L2)*9.81;
Theta_c * gamma_ddot = 0.5*L3*(F_f-F_b);

x = zeros(6,1)
dx = zeros(6,1)

x(1) = alpha;
x(2) = beta;
x(3) = gamma;
dx(1) = alpha_dot;
dx(2) = beta_dot;
dx(3) = gamma_dot;
x(4) = dx(1);
x(5) = dx(2);
x(6) = dx(3);
dx(4) = alpha_ddot;
dx(5) = beta_ddot;
dx(6) = gamma_ddot;

%Linearisierung
dx_lin = jacobian(dx,[alpha,beta,gamma,alpha_dot,beta_dot,gamma_dot]);
u_lin = jacabian(dx,[u(1),u(2)]);




