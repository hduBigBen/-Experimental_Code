% 获得gt的分割图像
%第一步： 读取txt文件，根据读取的到内容，查找相应路径下的文件，原图片，mat文件
%第二步： 根据mat文件，使用seg2bmap方法，得到线条图，并保存
%第三步： 根据mat文件和原图片，先使用mat文件和numLabel方法，得到区域个数，
%         然后使用原图片和mat文件，random_color方法，得到分割图像。
clear all;

% 读取txt文件
filename = '.\test.txt';
segImgDir = '.\test\';  % 测试数据目录
ImgDir = '.\image\';               % 原图片目录
ImgSaveDir = '.\Gt\';
imgNane = textread(filename,'%n',200);
k =length(imgNane);
for i=1:1:k
    image =imgNane(i);
    %segImgMatName= strcat (segImgDir, '100007' , '.mat') ;
    segImgMatName= strcat (segImgDir, num2str(image) , '.mat') ;
    imgName= strcat (ImgDir, num2str(image) , '.jpg') ;
    img= imread(imgName);
    [width,height,c] = size(img); % 图片的大小
   
    mat = load(segImgMatName); % 加载mat文件
    gt = mat.groundTruth;
    seg = double(gt{2}.Segmentation);
   
    numSeg = numLabel(seg);
    segImg = random_color(double(img),double(seg),numSeg);
    
    segImage = strcat (ImgSaveDir, num2str(image) , '.png') ;
    imwrite(segImg, segImage);
    
    Image = strcat (ImgSaveDir, num2str(image) ,  '.jpg') ;
    imwrite(img, Image);
    
    %gtseg = gtseg_all['groundTruth'][0][t][0][0][0]
    
    %lineExtraction = seg2bmap(Segmentation,height,width); % 提取线条
    
    
    %imshow(lineExtraction);
    
    % 保存提取线条图像
    %lineImage = strcat (ImgSaveDir, num2str(image) , '.jpg') ;
    %imwrite(lineExtraction, lineImage);
    
    % 计算区域个数
    %numSeg = numLabel(Segmentation);
    % random_color
    %segImg = random_color(double(img),double(Segmentation),numSeg);
    %segImage = strcat (ImgSaveDir, num2str(image) , '.png') ;
    %imwrite(segImg, segImage);
    
    %Image = strcat (ImgSaveDir, num2str(image) , 'a', '.jpg') ;
    %imwrite(img, Image);
    
end


