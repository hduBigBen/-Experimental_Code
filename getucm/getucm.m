filename = 'test.txt';
segImgDir = '.\test\';  % 测试数据目录
saveDir = '.\ucm\';
imgNane = textread(filename,'%n',200);
k =length(imgNane);

for i=1:1:k
    image =imgNane(i);
    segMatName= strcat (segImgDir, num2str(image) , '.mat') ;
    mat = load(segMatName); % 加载mat文件
    gt = mat.groundTruth;
    for gtid=1:length(gt)
        bmap = gt{gtid}.Boundaries;
        if gtid==1
            ucm = bmap;
        else
            ucm(bmap==true)=true;
        end
    end
    savematDir = strcat (saveDir, num2str(image) , '.mat') ;
    save(savematDir,'ucm');
end

% mat = load('97010.mat');
% %[~,image_name,~] = fileparts(file_list(i).name);
% gt = mat.groundTruth;
% for gtid=1:length(gt)
%     bmap = gt{gtid}.Boundaries;
%     if gtid==1
%         ucm = bmap;
%     else
%         ucm(bmap==true)=true;
%     end
% end
% % figure;
% % subplot(1,1,1)
% % imshow(image), title('Image')
% save('97010_ucm.mat','ucm');