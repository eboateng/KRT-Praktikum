% Masse von Tower
plastic_part = 283 * 1e-3

% Massen von Arm
Main_arm = 377 * 1e-3;
Second_arm = 138 * 1e-3;
Conter_weight = 1918 * 1e-3;
Magnet_with_bar = 70 * 1e-3;
Joint1 = 29 * 1e-3;
Joint2 = 106 * 1e-3;
Summe_Arm = 2638 * 1e-3;

% Massen von Heli(Antrieb)
Bodies = 2 * 200 * 1e-3;
Motors = 2 * 287 * 1e-3;
Bar = 322 * 1e-3;
Joint3 = 26 * 1e-3;
Summe_Heli = 1322 * 1e-3;

% Parameters in Model
M = Summe_Heli;
m = Conter_weight;
L1 = (228.5+305) * 1e-3;
L2 = 655 * 1e-3;
L3 = 355 * 1e-3;
Theta_a = m*L1^2 + M*L2^2;
Theta_b = Theta_a
Theta_c = (m*(0.5*L3)^2)/6


