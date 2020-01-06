
clear all;
filename = './test.txt';
ImgDir = './image/';  
sgeMat = './seg_gn8_all';
savedDir = './seg_gn8';
imgNane = textread(filename,'%n',200);
k =length(imgNane);

bound = 19:2:60;
%bound = 31:2:71;
%length(bound)
for i = 1:1:length(bound)
    threshold = bound(i) / 100.0;
    thresholda = sprintf('%0.2f',threshold); %������λС��
    if bound(i) <= 30
        min_size = [0, 1, 2, 3];
    else
         min_size = [0, 1, 2, 3, 4, 5, 6];
    end
    for j = 1:1:length(min_size)
        segImgDir = strcat(sgeMat,'/threshold_',thresholda,'_',num2str(min_size(j)),'/');
            for z=1:1:k
                imageNum =imgNane(z);
                ImgSaveDir = strcat(savedDir,'/',num2str(imageNum),'/');
                mkdir(ImgSaveDir)
                segImgMatName= strcat (segImgDir,num2str(imageNum),'.mat') ;
                imgName= strcat (ImgDir,num2str(imageNum),'.jpg') ;
                img= imread(imgName);
%                 [width,height,c] = size(img); % ͼƬ�Ĵ�С

                load(segImgMatName); 
%                 numSeg = numLabel(Segmentation);
                % random_color
                segImg = random_color(double(img),double(Segmentation),1);
                segImage = strcat (ImgSaveDir, num2str(imageNum) ,'_',thresholda,'_',num2str(min_size(j)),'.jpg') ;
                imwrite(segImg, segImage);

            end
    end
end

