t_travel = 180/pi .*(out.Trajectory_points.Data(:,1));
t_elevation = 180/pi .*(out.Trajectory_points.Data(:,2));
t_time = out.Trajectory_points.Time;

alpha_t1 = [0 1 3 45 80 85 89  90];
alpha_t2 = [90 91 93 135 330 400 447 450];
alpha_t3 = [450 447 400 330 135 93 91 90 90 89 85 80 45 3 1 0];

beta_t1 = [-27 -0.8 0 2 1 0.9 0.5 -22];
beta_t2 = [-22 -0.8 0 2 1 0.9  0.5 -22];
beta_t3 = [-22 0 1 1.6 2 2.1 2.2 2.3 2.4 2.3 2.2 2.1 1.7 1 0 -27];


alpha_waypoints = [alpha_t1 alpha_t2 alpha_t3 ];
beta_waypoints =  [beta_t1 beta_t2 beta_t3];
cpts = [alpha_waypoints; beta_waypoints];
tpts = [0 5];

time = .1*(0:65);
tvec =0:0.01:65 ;
[path, qd, qdd, pp] = bsplinepolytraj(cpts,tpts,tvec);


xlim([-2 120])
ylim([-28 2])
axes1 = axes('Parent', figure);
hold(axes1,'on');

%plot(path(1,:), path(2,:))

frm1_alpa =(45*100)+ find(t_travel == 90,1);
x1 = t_time(1:(frm1_alpa));
yd1 = t_elevation(1:frm1_alpa);
p = fit(x1,yd1,'poly2')
plot(p,x1,yd1)


% frm2_alpa = find(t_travel == 450,1);
% x2 = t_travel(frm1_alpa:frm2_alpa);
% y2 = t_elevation(frm1_alpa:frm2_alpa);
% p = fit(x2,yd2,'smoothingspline')
% plot(p,x2,y2)

% x3 = flip(t_travel(frm2_alpa:end));
% yd3 = t_elevation(frm2_alpa:end);
% p = polyfit(x3,yd3,5)
% y3 = polyval(p,x3)

rectangle('Parent',axes1,'Position',[-5 -27 5 27],'FaceColor',[0.8 0.8 0.8],'EdgeColor','none'); % Plots the rectangle
rectangle('Parent',axes1,'Position',[15 -27 60 27],'FaceColor',[0.8 0.8 0.8],'EdgeColor','none'); % Plots the rectangle
rectangle('Parent',axes1,'Position',[105 -27 330 27],'FaceColor',[0.8 0.8 0.8],'EdgeColor','none'); % Plots the rectangle
rectangle('Parent',axes1,'Position',[465 -27 5 27],'FaceColor',[0.8 0.8 0.8],'EdgeColor','none'); % Plots the rectangle

% plot(x1,y1,x2,y2)%,x3,y3)
% markr1 = find(time==27)
% markr2 = find(time==27)
% t1 = time(0:(find(time==27)));
% travel= linspace(0,450, length(alphapoints));
% %alpha1=
% %beta1 =
% hold on
% plot(x,y)
% xlim([-5 120]) % set plot limits
% lim1 = area(linspace(0,90,10),linspace(-27,0,10))