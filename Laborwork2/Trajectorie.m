%Trajectory design


hx = linspace(0,1,40);

cpts = [ -27 -22 -22 -27; 0 90 450 0;];
tpts = [0 4]
tvec = 0:0.01:5;

[q, qd, qdd, pp] = bsplinepolytraj(cpts,tpts,tvec);

figure
plot(cpts(1,:),cpts(2,:),'xb-')
hold all
plot(uvec(1,:), uvec(2,:))
xlabel('X')
ylabel('Y')
hold off

% figure
% plot(tvec,q)
% hold all
% plot([0:length(cpts)-1],cpts,'x')
% xlabel('t')
% ylabel('Position Value')
% legend('X-positions','Y-positions')
% hold off