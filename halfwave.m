f = @(t) 27* sin(t).*(sin(t)>=0);            % Half-Wave Rectified Sine Function
t = linspace(0, pi);
figure(1)
plot(t, f(t))
grid
%axis([0  4*pi    -1.5  1.5])
% 
% Start = [0 -27];
% Cargo_pick = [90 -22];
% Cargo_desitination = [450 -22];
% Finishing =  [0 -27];

