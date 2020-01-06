figure(1)
box on;
grid on;
x=[100,200,300,600,1000];
FLIC =[0.48457,0.45464,0.43787,0.39392,0.36435745];  % FLIC
SLIC =[0.43972,0.44888,0.4444,0.42825,0.40420365];  % SLIC
SSN = [0.52449,0.49166,0.4544,0.42825,0.3962791]; %SSN
LSC = [0.49107,0.45978,0.44021,0.40322,0.3758934]; %LSC
WT = [0.51836,0.48089,0.46390605,0.42154,0.383651]; %WT

% STS-BN 
% STS-GN32
% STS-w/o-con
% STS-conv7
STS_GN8 = [0.546793,0.511529, 0.49107165, 0.43781505,0.39517875]; %STS-GN8


hold on
values_SSN = spcrv([[x(1) x x(end)];[SSN(1) SSN SSN(end)]],3);
plot(values_SSN(1,:),values_SSN(2,:), '-.m','LineWidth',2);

hold on
values = spcrv([[x(1) x x(end)];[FLIC(1) FLIC FLIC(end)]],3);
plot(values(1,:),values(2,:), '-.r','LineWidth',2);
% 
hold on
values2 = spcrv([[x(1) x x(end)];[SLIC(1) SLIC SLIC(end)]],3);
plot(values2(1,:),values2(2,:), '-.b','LineWidth',2);
% 
hold on
values_LSC = spcrv([[x(1) x x(end)];[LSC(1) LSC LSC(end)]],3);
plot(values_LSC(1,:),values_LSC(2,:), '--g','LineWidth',2);
% 
hold on
values_WT = spcrv([[x(1) x x(end)];[WT(1) WT WT(end)]],3);
plot(values_WT(1,:),values_WT(2,:), '--.g','LineWidth',2);
% 
% 
hold on
values_STS_GN8 = spcrv([[x(1) x x(end)];[STS_GN8(1) STS_GN8 STS_GN8(end)]],3);
plot(values_STS_GN8(1,:),values_STS_GN8(2,:), '-','Color',[0.4157, 0.5373, 0.0824],'LineWidth',2);







axis([100,1000,0.35,0.55])
set(gca,'XTick',[100:100:1000],'FontSize',16) %改变x轴坐标间隔显示 这里间隔为10
set(gca,'YTick',[0.3:0.05:0.6],'FontSize',16) %改变y轴坐标间隔显示 这里间隔为10
% legend('SSN','FLIC','SLIC','LSC','WT','ours-sp'); 
legend({'SSN','FLIC','SLIC','LSC','WT','ours-sp'},'FontSize',16); 
xlabel('The number of superpixel','FontSize',16);
ylabel('Boundary F-measure','FontSize',16)
% title('Boundary F-measure')
box on;
grid on;