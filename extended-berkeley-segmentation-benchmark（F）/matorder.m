% .mat order by imageNum 
clear all;
filename = './test.txt';
getMatDir = 'data/BSDS500/result_sts_0.0001_350000_1000';

saveMatDir = 'data/BSDS500/sts_0.0001_350000_1000/';

imgNane = textread(filename,'%n',200);
k =length(imgNane);

bound = 1:2:71;
%length(bound)
a = 1;
for i = 1:1:length(bound)
    threshold = bound(i) / 100.0;
    thresholda = sprintf('%0.2f',threshold); %������λС��
    if bound(i) <= 30
        min_size = [0, 1, 2, 3];
    else
         %min_size = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
         min_size = [0, 1, 2, 3, 4, 5, 6];
         
         
    end
    for j = 1:1:length(min_size)
        segImgDir = strcat(getMatDir,'/threshold_',thresholda,'_',num2str(min_size(j)),'/');
            for z=1:1:k
                imageNum =imgNane(z);

                ImgSaveDir = strcat(saveMatDir,num2str(imageNum),'/');
                
                segImgMatName= strcat (segImgDir,num2str(imageNum),'.mat') ;
             
                load(segImgMatName); % ����mat�ļ�
              
                segImage = strcat (ImgSaveDir, num2str(imageNum) ,num2str(a), '.mat') ;
                save(segImage,'Segmentation');
            end
            a = a + 1;
    end
end