% png to mat
clear all;
filename = './test.txt';
imgNane = textread(filename,'%n',200);
k =length(imgNane);

bound = 37:2:53;
%bound = 31:2:71;
for i = 1:1:length(bound)
    threshold = bound(i) / 100.0;
    thresholda = sprintf('%0.2f',threshold); %������λС��
    if bound(i) <= 30
        min_size = [0, 1];
    else
         min_size = [0];
         %min_size = [0, 1, 2, 3, 4, 5, 6];
    end
    for j = 1:1:length(min_size)
        segImgDir = strcat('./DeepSeg_200/threshold_',thresholda,'_',num2str(min_size(j)),'/');
        segMatDir = strcat('./Seg_Del+ours_200/threshold_',thresholda,'_',num2str(min_size(j)));

%         imageNum =100007;  
%         segImgPngName= strcat (segImgDir,num2str(imageNum),'.png') ;
%         groundtruth= imread('1.png');
%         segImage = strcat ('1.mat') ;           
%         save(segImage,'groundtruth');
        mkdir(segMatDir);
            for z=1:1:k
                imageNum =imgNane(z);  
                segImgPngName= strcat (segImgDir,num2str(imageNum),'.png') ;
                Segmentation= imread(segImgPngName);
                segImage = strcat (segMatDir, '/',num2str(imageNum),'.mat') ;           
                save(segImage,'Segmentation');
            end
    end
end

