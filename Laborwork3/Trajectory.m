alpha_t1 = [0 1 3 45 80 85 89  90];
alpha_t2 = [90 91 93 135 330 400 447 450];
alpha_t3 = [450 447 400 330 135 93 91 90 90 89 85 80 45 3 1 0];

beta_t1 = [-27 8 10 12 11 10 9 -22];
beta_t2 = [-22 8 10 12 11 10  9 -22];
beta_t3 = [-22 10 11 12 12 12.1  12.2 12.3 12.4 12.3 12.2 12.1 12 11 10 -27];
alpha_waypoints = [alpha_t1 alpha_t2 alpha_t3 ];
beta_waypoints =  [beta_t1 beta_t2 beta_t3];
cpts = [alpha_waypoints; beta_waypoints];
tpts = [0 5];

time = .1*(0:65);
tvec =0:0.01:65 ;
[path, qd, qdd, pp] = bsplinepolytraj(cpts,tpts,tvec);

figure
%plot(cpts(1,:),cpts(2,:),'xb-')
%hold all
plot(path(1,:), path(2,:))
xlabel('X')
ylabel('Y')
hold off

alpha_path = path(1,:);
beta_path = path(2,:);

sig_alpha_ts = timeseries(alpha_path)
sig_beta_ts = timeseries(beta_path)
