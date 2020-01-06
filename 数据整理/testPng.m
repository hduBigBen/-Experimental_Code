clear all;
filename = './test.txt';
% ImgDir = './image/';              % ԭͼƬĿ¼
ImgSaveDir = './GT_png/';
mkdir(ImgSaveDir);
 imgNane = textread(filename,'%n',200);
 k =length(imgNane);
% 
segImgDir = './Gt/';
 for z=1:1:k
     imageNum =imgNane(z);
%     imageNum = '100007';
    segImgMatName= strcat (segImgDir,num2str(imageNum),'.mat') ;
   load(segImgMatName);
    segImage = strcat (ImgSaveDir,num2str(imageNum), '.png') ;
    imwrite(groundTruth{1}.Segmentation, segImage);
 end






