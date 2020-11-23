function [V_front V_back] = model_voltage(data)
 
data=load('D:\MSc\KRT-Praktikum\data\data1.mat')

M = data.M;
Frontmotor = M.F;
Backmotor = M.B;
U_v = data.U.F;
coeff_front = polyfit(U_v,Frontmotor,2)
coeff_back = polyfit(U_v,Backmotor,2)

end