% make_gt_bondary_image.m
% bsdsRoot 变量的值为包含train、test、val文件夹的地址
%在处理时应当提前在train、test、和val下新建文件夹bon，bon里需要新建train、test、val两个子文件夹
bsdsRoot = './groundTruth';
state = 'train';%修改为test或train或val，分别处理两个文件夹 
file_list = dir(fullfile(bsdsRoot,state,'*.mat'));%获取该文件夹中所有jpg格式的图像
for i=1:length(file_list)
    mat = load(fullfile(bsdsRoot,state,file_list(i).name));
    [~,image_name,~] = fileparts(file_list(i).name);
    gt = mat.groundTruth;
%     for gtid=1:length(gt)
        bmap = gt{1}.Boundaries;
%         if gtid==1
            image = bmap;
%         else
%             image(bmap==true)=true;
%         end
 
%     end
    %黑底白边
    %imwrite(double(image),fullfile(bsdsRoot,'bon',state,[image_name '.jpg']));
    %白底黑边
    imwrite(1-double(image),fullfile(bsdsRoot,'bon',state,[image_name '_1.jpg']));
 
end