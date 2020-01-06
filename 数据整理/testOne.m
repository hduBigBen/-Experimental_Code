
clear all;
filename = './test.txt';
ImgDir = './image/';               % ԭͼƬĿ¼
imgNane = textread(filename,'%n',200);
k =length(imgNane);

segImgDir = './KWFLICM/';
ImgSaveDir = './img_KWFLICM/';
mkdir(ImgSaveDir);
for z=1:1:k
    imageNum =imgNane(z);
    % ͼƬ����Ŀ¼
 
    segImgMatName= strcat (segImgDir,num2str(imageNum),'.mat') ;
    imgName= strcat (ImgDir,num2str(imageNum),'.jpg') ;
    img= imread(imgName);
    [width,height,c] = size(img); % ͼƬ�Ĵ�С

    load(segImgMatName); % ����mat�ļ�         
   % numSeg = numLabel(Segmentation);
    % random_color
    segImg = random_color(double(img),double(Segmentation),1);
    segImage = strcat (ImgSaveDir, num2str(imageNum),'_KWFLICM.jpg') ;
    imwrite(segImg, segImage);
end

