clc;clear;close all;
figure(1)
box on;
grid on;
axis([0.2,0.8, 0.5,0.7])
set(gca,'XTick',[0.2:0.1:0.8],'FontSize',16) %改变x轴坐标间隔显示 这里间隔为10
set(gca,'YTick',[0.5:0.04:0.7],'FontSize',16) %改变y轴坐标间隔显示 这里间隔为10
xlabel('Time in Seconds','FontSize',16);
ylabel( 'Boundary F-measure','FontSize',16);
% title('image segmentation - Boundary & Time')

hold on;
% x = 0:0.1:1;
x = [0.451, 0.736, 0.709191, 0.282408, 0.358, 0.393,   0.404];  %Time
y = [0.68954,0.62214, 0.54456, 0.60163,0.66105, 0.68513,    0.68617]; %'Boundary F-measure
ss = blanks(7);
ss(1) = 'o';ss(2) = '+'; ss(3) = '*'; ss(4) = 'v'; ss(5) = 'x';
 ss(6) = 's';ss(7) = 'd'; %ss(8) = '^'; ss(9) = 'v'; ss(10) = 'p';
%cc = blanks(7);
cc = [1.0000, 0.0000, 0.0000];
% cc(1) = 'b';
cc(2) = 'm'; cc(3) = 'k'; cc(4) = 'r'; cc(5) = 'k';
 cc(6) = 'b';cc(7) = 'k'; %cc(8) = 'k'; cc(9) = 'y'; cc(10) = 'm';
% for ii=1:7
%     scatter(x(ii),y(ii),200,[1.0000, 0.0000, 0.0000],ss(ii))
% end

scatter(x(1),y(1),200,[1.0000, 0.0000, 0.0000],ss(1),'LineWidth',2)
scatter(x(2),y(2),200,[0.7059, 0.5333, 0.8824],ss(2),'LineWidth',2)
scatter(x(3),y(3),200,[0.7098, 0.2000, 0.3608],ss(3),'LineWidth',1)
scatter(x(4),y(4),200,[0.4902, 0.0706, 0.6863],ss(4),'LineWidth',2)
scatter(x(5),y(5),200,[0.0392, 0.4275, 0.2667],ss(5),'LineWidth',2)
scatter(x(6),y(6),200,[0.4157, 0.5373, 0.0824],ss(6),'LineWidth',2)
scatter(x(7),y(7),200,[0.0000, 0.0000, 1.0000],ss(7),'LineWidth',2)

legend({'DEL','SFFCM','align-hier','EGB','ours-seg_b_n','ours-seg_g_n_3_2','ours-seg_g_n_8'},'FontSize',14,'Location','southwest')