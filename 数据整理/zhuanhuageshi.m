% .mat namad segs cell
clear all;
filename = './test.txt';
matFile = './data'; 
saveFile = './segs';
mkdir(saveFile);
imgNane = textread(filename,'%n',200);
k =length(imgNane);
bound = 1:2:71;

for i = 1:1:length(bound)
    threshold = bound(i) / 100.0;
    thresholda = sprintf('%0.2f',threshold); %������λС��
    if bound(i) <= 30
        min_size = [0, 1, 2, 3];
    else
        % min_size = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];        
         min_size = [0, 1, 2, 3, 4, 5, 6];  
    end
    for j = 1:1:length(min_size)
        segImgDir = strcat(matFile,'/threshold_',thresholda,'_',num2str(min_size(j)),'/');
        for z=1:1:k
            imageNum =imgNane(z);
            segImgMatName= strcat (segImgDir,num2str(imageNum),'.mat') ;
            load(segImgMatName); 
            segs = cell(1);
            segs{1} = Segmentation;
            matSaveDir = strcat(saveFile,'/',num2str(imageNum),'/');
            segImage = strcat (matSaveDir, num2str(imageNum) , '.mat') ;
            save(segImage,'segs');
        end
    end
end