% make_gt_bondary_image.m
% bsdsRoot ������ֵΪ����train��test��val�ļ��еĵ�ַ
%�ڴ���ʱӦ����ǰ��train��test����val���½��ļ���bon��bon����Ҫ�½�train��test��val�������ļ���
bsdsRoot = './groundTruth';
state = 'train';%�޸�Ϊtest��train��val���ֱ��������ļ��� 
file_list = dir(fullfile(bsdsRoot,state,'*.mat'));%��ȡ���ļ���������jpg��ʽ��ͼ��
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
    %�ڵװױ�
    %imwrite(double(image),fullfile(bsdsRoot,'bon',state,[image_name '.jpg']));
    %�׵׺ڱ�
    imwrite(1-double(image),fullfile(bsdsRoot,'bon',state,[image_name '_1.jpg']));
 
end