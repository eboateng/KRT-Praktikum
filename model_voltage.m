%This function models the voltage-force relationship

function [F_fr, F_bk] = model_voltage(V_f, V_b)

%set the default parameters 
if nargin < 1
    V_f = 4;
    V_b = 4;
%else if nargin == 1
%        V_b = V_f;
end

%load the data file
data=load('data1.mat');

M = data.M;
Frontmotor = M.F;
Backmotor = M.B;
U_v = data.U.F;

%determine coefficients of the the curve
coeff_front = polyfit(U_v,Frontmotor,2);
coeff_back = polyfit(U_v,Backmotor,2);

%calculate the Force based on the corresponding voltage
F_fr = coeff_front(1)*V_f^2 + coeff_front(2)*V_f + coeff_front(3);
F_bk = coeff_back(1)*V_b^2 + coeff_back(2)*V_b + coeff_back(3);
end