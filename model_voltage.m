function [V_front V_back] = model_voltage(F_f ,F_b)
 
data=load('data1.mat')

M = data.M;
Frontmotor = M.F;
Backmotor = M.B;
U_v = data.U.F;
coeff_front = polyfit(U_v,Frontmotor,2);
coeff_back = polyfit(U_v,Backmotor,2);

V_front = coeff_front(1)*F_f^2 + coeff_front(2)*F_f + coeff_front(3)
V_back = coeff_back(1)*F_b^2 + coeff_back(2)*F_b + coeff_back(3)
end