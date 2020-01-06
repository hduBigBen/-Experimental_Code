clear all;
figure
subplot(1,1,1)
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