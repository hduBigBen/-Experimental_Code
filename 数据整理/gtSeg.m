% ���gt�ķָ�ͼ��
%��һ���� ��ȡtxt�ļ������ݶ�ȡ�ĵ����ݣ�������Ӧ·���µ��ļ���ԭͼƬ��mat�ļ�
%�ڶ����� ����mat�ļ���ʹ��seg2bmap�������õ�����ͼ��������
%�������� ����mat�ļ���ԭͼƬ����ʹ��mat�ļ���numLabel�������õ����������
%         Ȼ��ʹ��ԭͼƬ��mat�ļ���random_color�������õ��ָ�ͼ��
clear all;

% ��ȡtxt�ļ�
filename = '.\test.txt';
segImgDir = '.\test\';  % ��������Ŀ¼
ImgDir = '.\image\';               % ԭͼƬĿ¼
ImgSaveDir = '.\Gt\';
imgNane = textread(filename,'%n',200);
k =length(imgNane);
for i=1:1:k
    image =imgNane(i);
    %segImgMatName= strcat (segImgDir, '100007' , '.mat') ;
    segImgMatName= strcat (segImgDir, num2str(image) , '.mat') ;
    imgName= strcat (ImgDir, num2str(image) , '.jpg') ;
    img= imread(imgName);
    [width,height,c] = size(img); % ͼƬ�Ĵ�С
   
    mat = load(segImgMatName); % ����mat�ļ�
    gt = mat.groundTruth;
    seg = double(gt{2}.Segmentation);
   
    numSeg = numLabel(seg);
    segImg = random_color(double(img),double(seg),numSeg);
    
    segImage = strcat (ImgSaveDir, num2str(image) , '.png') ;
    imwrite(segImg, segImage);
    
    Image = strcat (ImgSaveDir, num2str(image) ,  '.jpg') ;
    imwrite(img, Image);
    
    %gtseg = gtseg_all['groundTruth'][0][t][0][0][0]
    
    %lineExtraction = seg2bmap(Segmentation,height,width); % ��ȡ����
    
    
    %imshow(lineExtraction);
    
    % ������ȡ����ͼ��
    %lineImage = strcat (ImgSaveDir, num2str(image) , '.jpg') ;
    %imwrite(lineExtraction, lineImage);
    
    % �����������
    %numSeg = numLabel(Segmentation);
    % random_color
    %segImg = random_color(double(img),double(Segmentation),numSeg);
    %segImage = strcat (ImgSaveDir, num2str(image) , '.png') ;
    %imwrite(segImg, segImage);
    
    %Image = strcat (ImgSaveDir, num2str(image) , 'a', '.jpg') ;
    %imwrite(img, Image);
    
end


