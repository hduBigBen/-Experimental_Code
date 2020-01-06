% ��ԭĿ¼����

clear all;
filename = '.\test.txt';
ImgDir = '.\image\';               % ԭͼƬĿ¼
imgNane = textread(filename,'%n',200);
k =length(imgNane);


bound = 1:2:71;
%length(bound)
for i = 1:1:length(bound)
    threshold = bound(i) / 100.0;
    thresholda = sprintf('%0.2f',threshold); %������λС��
    if bound(i) <= 30
        min_size = [0, 1, 2, 3, 4, 5, 6];
    else
         min_size = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    end
    for j = 1:1:length(min_size)
        segImgDir = strcat('.\seg_gn8_all\threshold_',thresholda,'_',num2str(min_size(j)),'\');
        ImgSaveDir = strcat('.\saved\threshold_',thresholda,'_',num2str(min_size(j)),'\');
        mkdir(ImgSaveDir);
        for z=1:1:k
            imageNum =imgNane(z);
            segImgMatName= strcat (segImgDir,num2str(imageNum),'.mat') ;
%             imgName= strcat (ImgDir,num2str(imageNum),'.jpg') ;
%             img= imread(imgName);
%             [width,height,c] = size(img); % ͼƬ�Ĵ�С

            load(segImgMatName); % ����mat�ļ�
%             lineExtraction = seg2bmap(Segmentation,height,width); % ��ȡ����
%             numSeg = numLabel(Segmentation);
            % random_color
            segImg = random_color(double(img),double(Segmentation),1);
            segImage = strcat (ImgSaveDir, num2str(imageNum), '.jpg') ;
            imwrite(segImg, segImage);

        end
    end
end