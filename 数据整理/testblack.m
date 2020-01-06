clear all;
% ͼƬ����Ŀ¼
img= imread('15062.jpg');
[width,height,c] = size(img); % ͼƬ�Ĵ�С

load('15062.mat'); % ����mat�ļ�
lineExtraction = seg2bmap(Segmentation,height,width); % ��ȡ����


% imshow(lineExtraction);
% ������ȡ����ͼ��
%lineImage = strcat (ImgSaveDir, num2str(imageNum) , '.jpg') ;
%imwrite(lineExtraction, lineImage);

% �����������?
numSeg = numLabel(Segmentation);
% random_color
segImg = random_color(double(img),double(Segmentation),numSeg);

% Lseg1 = Label_image(img,Segmentation);

% figure,imshow(Lseg1);

figure,imshow(segImg);




