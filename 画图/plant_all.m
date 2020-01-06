clear all;
figure
subplot(1,3,1)
box on;
grid on;
% BR BP
DELData ='./data2/del9.txt';
SFFCMData ='./data2/SFFCM.txt';
alignData ='./data2/align.txt';
FLICMData = './data2/FLICM.txt';
EGBData ='./data2/EGB.txt';
bnData = './data2/bn.txt';
gn32Data = './data2/gn32.txt';
oursData = './data2/ours.txt';


%DEL
DEL = textread(DELData);
for i = 1:1:length(DEL)
    DELBR(i) = DEL(i,1);
    DELBP(i) = DEL(i,2);
end
hold on
values_DEL = spcrv([[DELBR(1) DELBR DELBR(end)];[DELBP(1) DELBP DELBP(end)]],3);
plot(values_DEL(1,:),values_DEL(2,:)*1.5, '--','Color',[1.0000, 0.0000, 0.0000],'LineWidth',2);

%SFFCM
SFFCM = textread(SFFCMData);
for i = 1:1:length(SFFCM)
    SFFCMBR(i) = SFFCM(i,1);
    SFFCMBP(i) = SFFCM(i,2);
end
hold on
values_SFFCM = spcrv([[SFFCMBR(1) SFFCMBR SFFCMBR(end)];[SFFCMBP(1) SFFCMBP SFFCMBP(end)]],3);
plot(values_SFFCM(1,:),values_SFFCM(2,:)*1.5, '--','Color',[0.7059, 0.5333, 0.8824],'LineWidth',2);


% align
align = textread(alignData);
for i = 1:1:length(align)
    alignBR(i) = align(i,1);
    alignBP(i) = align(i,2);
end

hold on
values_align = spcrv([[alignBR(1) alignBR alignBR(end)];[alignBP(1) alignBP alignBP(end)]],3);
plot(values_align(1,:),values_align(2,:)*1.5, '--','Color',[0.7098, 0.2000, 0.3608],'LineWidth',2);

% EGB
EGB = textread(EGBData);
for i = 1:1:length(EGB)
    EGBBR(i) = EGB(i,1);
    EGBBP(i) = EGB(i,2);
end

hold on
values_EGB = spcrv([[EGBBR(1) EGBBR EGBBR(end)];[EGBBP(1) EGBBP EGBBP(end)]],3);
plot(values_EGB(1,:),values_EGB(2,:)*1.5, '--','Color',[0.4902, 0.0706, 0.6863],'LineWidth',2);

%oursBn
bn = textread(bnData);
for i = 1:1:length(bn)
    bnBR(i) = bn(i,1);
    bnBP(i) = bn(i,2);
end
hold on
values_bn = spcrv([[bnBR(1) bnBR bnBR(end)];[bnBP(1) bnBP bnBP(end)]],3);
plot(values_bn(1,:) ,values_bn(2,:)*1.5 , '-','Color',[0.0392, 0.4275, 0.2667],'LineWidth',2);

%gn32Data
gn32 = textread(gn32Data);
for i = 1:1:length(gn32)
    gn32BR(i) = gn32(i,1);
    gn32BP(i) = gn32(i,2);
end
hold on
values_gn32 = spcrv([[gn32BR(1) gn32BR gn32BR(end)];[gn32BP(1) gn32BP gn32BP(end)]],3);
plot(values_gn32(1,:) ,values_gn32(2,:)*1.5 , '-','Color',[0.4157, 0.5373, 0.0824],'LineWidth',2);

%oursData
ours = textread(oursData);
for i = 1:1:length(ours)
    oursBR(i) = ours(i,1);
    oursBP(i) = ours(i,2);
end
hold on
values_ours = spcrv([[oursBR(1) oursBR oursBR(end)];[oursBP(1) oursBP oursBP(end)]],3);
plot(values_ours(1,:) ,values_ours(2,:)*1.5 , '-','Color',[0.0000, 0.0000, 1.0000],'LineWidth',2);

axis([0.5,1,0,0.25])
set(gca,'XTick',[0.5:0.1:1],'FontSize',16) %改变x轴坐标间隔显示 这里间隔为10
set(gca,'YTick',[0:0.05:0.25],'FontSize',16) %改变y轴坐标间隔显示 这里间隔为10
legend({'DEL','SFFCM','align-hier','EGB','ours-seg_b_n','ours-seg_g_n_3_2','ours-seg_g_n_8'},'FontSize',14); 
xlabel('Boundary Recall','FontSize',16)
ylabel('Boundary Precision','FontSize',16)
% title('Boundary F-measure')
box on;
grid on;


% 分割-时间
subplot(1,3,2)
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
cc = blanks(7);
cc(1) = 'b';cc(2) = 'm'; cc(3) = 'k'; cc(4) = 'r'; cc(5) = 'k';
 cc(6) = 'b';cc(7) = 'k'; %cc(8) = 'k'; cc(9) = 'y'; cc(10) = 'm';
for ii=1:7
    scatter(x(ii),y(ii),200,cc(ii),ss(ii))
end

legend({'DEL','SFFCM','align-hier','EGB','ours-seg_b_n','ours-seg_g_n_3_2','ours-seg_g_n_8'},'FontSize',14,'Location','southwest')

%legend({'a','b','c','d','e'},'Location','southwest')





% 超像素
subplot(1,3,3)
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