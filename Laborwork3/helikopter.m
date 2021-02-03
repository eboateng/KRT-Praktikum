%Gravitaional acc
g = 9.81;

%Masse von Tower
m_plastic_part = 283 * 1e-3;

%Massen von Arm
m_main_arm = 377 * 1e-3;
m_second_arm = 138 * 1e-3;
m_conter_weight = 1918 * 1e-3;
m_magnet = 70 * 1e-3;
m_joint1 = 29 * 1e-3;
m_joint2 = 106 * 1e-3;
Summe_arm = 2638 * 1e-3;

% Massen von Heli(Antrieb)
m_body = 200 * 1e-3;
m_motor = 287 * 1e-3;
m_bar = 322 * 1e-3;
m_joint3 = 26 * 1e-3;
Summe_heli = 1322 * 1e-3;

%längen:
L1 = (228.5+305) * 1e-3;
L2 = 655 * 1e-3;
L3 = 355 * 1e-3;


%Abstände der Heli-Körperschwerpunkte zum Gelenkpunkt Joint_3
l_body = (sqrt((355/2)^2 + (69+27/2-41)^2))*1e-3;
l_motor = (sqrt((355/2)^2 + (41 - 69/2)^2))*1e-3;
l_bar = (41 + 6/2)*1e-3;
l_joint3 = (41 - 19/2)*1e-3;


%Abstände der Arm-Körperschwerpunkte zum Gelenkpunkt Joint_1 
l_heli = (sqrt((42 + 19 + 28)^2 + (655)^2))*1e-3;
l_MainArm = (sqrt((655 - 915/2)^2 + (42 +19/2)^2))*1e-3;
l_SecArm = (sqrt((228.5 + cos(16*pi/180)*135.5)^2 + (42 +19/2 -sin(16*pi/180)*135.5)^2))*1e-3;
l_Conter = (sqrt((228.5 + cos(16*pi/180)*262)^2 + (42 +19/2 -sin(16*pi/180)*262)^2))*1e-3;
l_Magnet = (sqrt((655 - 152 + 124*cos(60*pi/180))^2 + (42 +19 +124*sin(60*pi/180)^2)))*1e-3;
l_Joint2 = (sqrt((42 + 19 + 18)^2 + (655)^2))*1e-3;
l_Joint1 = (41 - 19/2)*1e-3;

%Horizontale Abstände der Körperschwerpunkte zu Joint1
lG_MainArm = (655 - 915/2)*1e-3;
lG_SecArm = (228.5 + cos(16*pi/180)*135.5)*1e-3;
lG_Conter = (228.5 + cos(16*pi/180)*262)*1e-3;
lG_Magnet = (655 - 152 + 124*cos(60*pi/180))*1e-3;

% Trägheitsmomente:
theta_c = 2*(m_body*l_body^2 + m_motor*l_motor^2) + m_bar*l_bar^2 + m_joint3*l_joint3^2;

theta_b = Summe_heli*l_heli^2 + m_main_arm*l_MainArm^2 + m_second_arm*l_SecArm^2 + ... 
    m_conter_weight*l_Conter^2 + m_magnet*l_Magnet^2 + m_joint1*l_Joint1^2 + m_joint2*l_Joint2^2;

theta_a = Summe_heli*L2^2 + m_main_arm*lG_MainArm^2 + m_second_arm*lG_SecArm^2 + ... 
    m_conter_weight*lG_Conter^2 + m_magnet*lG_Magnet^2 + m_joint2*L2^2;

% Drehmoment in der Beta-Dynamik 
M_beta = g*(-Summe_heli*L2 - m_main_arm*lG_MainArm + m_second_arm*lG_SecArm + ... 
    m_conter_weight*lG_Conter - m_magnet*lG_Magnet - m_joint2*L2);
