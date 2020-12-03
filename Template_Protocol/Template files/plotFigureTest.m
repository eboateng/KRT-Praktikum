
% test file to export figure to latex

%% create figure
hFig = figure;
x = 0:0.01:1;
plot(x,sin(x),'k')
xlabel('Time $t$ (s)','Interpreter','latex') 
ylabel('Control input $u$ (V)','Interpreter','latex')
grid on
set(gca,'xtick',0:0.25:1)
set(gca,'ytick',0:0.25:1)
set(gca,'ylim',[0 1])

% add matlab2tikz to the Matlab Path (choose as width of the figure a
% parameter which you can later set in LaTeX (here: "\figurewidth"))
matlab2tikz('FigureTest.tikz','width','\figurewidth', 'encoding', 'utf8' )