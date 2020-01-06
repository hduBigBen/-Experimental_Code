clc;clear;close all;
figure(1)
box on;
grid on;
xlabel('GCE','FontSize',10);
ylabel('RI','FontSize',10);
title('superpixel segmentation - GCE & RI')

hold on;
% x = 0:0.1:1;
x = [0.1138,  0.1451, 0.0823,  0.0899, 0.0881]; %GCE
y = [0.7189, 0.7169, 0.7148, 0.7138, 0.7188];  %RI

ss = blanks(5);
ss(1) = 'o';ss(2) = '+'; ss(3) = '*'; ss(4) = 'v'; ss(5) = 'x';
% ss(6) = 's';ss(7) = 'd'; ss(8) = '^'; ss(9) = 'v'; ss(10) = 'p';
cc = blanks(5);
cc(1) = 'b';cc(2) = 'm'; cc(3) = 'k'; cc(4) = 'r'; cc(5) = 'k';
% cc(6) = 'b';cc(7) = 'w'; cc(8) = 'k'; cc(9) = 'y'; cc(10) = 'm';
for ii=1:5
    scatter(x(ii),y(ii),100,cc(ii),ss(ii))
end
legend('FLIC(2016)','SLIC(2012 TPAMI)','SSN(2018 CVPR)','WT(2015 ICIP)','our-sp')

%legend({'a','b','c','d','e'},'Location','southwest')