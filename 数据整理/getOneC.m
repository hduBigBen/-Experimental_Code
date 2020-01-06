% 
% imageNum ='246009';
% ImgDir = './img_first_gn8/';
% ImgSaveDir = './mine_png/';
% imgName = strcat (ImgDir,num2str(imageNum),'_gn8.jpg') ;
% 
% img= imread(imgName);
% 
% seg = img(:,:,1);
% segImage = strcat (ImgSaveDir, num2str(imageNum), '.png') ;
% imwrite(seg, segImage);


clear all;
ImgDir = './image/';               % ԭͼƬĿ¼

imgName= strcat (ImgDir,'384022.jpg') ;
img= imread(imgName);

load('384022.mat'); % ����mat�ļ�         
% random_color
segImg = random_color(double(img),double(Segmentation),1);
segImage = '384022_ours.jpg' ;
imwrite(segImg, segImage);

