addpath benchmarks
clear all;close all;clc;
%% 3. Test boundary benchmark for results stored as a cell of segmentations:
% 作为分段单元存储的结果的测试边界基准：
imgDir = 'data/BSDS500/images';
gtDir = 'data/BSDS500/groundTruth';
pbDir = 'data/BSDS500/seg_42/';
outDir = 'tests/test_region_seg_42/';
mkdir(outDir);



nthresh = 99; % note: the code changes this to the actual number of segmentations
tic;

bound = 25:2:31 ;
for i = 1:1:length(bound)
    threshold = bound(i) / 100.0;
    thresholda = sprintf('%0.2f',threshold); %������λС��
    if bound(i) <= 30
        min_size = [0];
    else
         %min_size = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];        
        min_size = [0];         
    end
    for j = 1:1:length(min_size)
        pbDira = strcat(pbDir,'threshold_',thresholda,'_',num2str(min_size(j)),'/');
        outDira = strcat(outDir,'threshold_',thresholda,'_',num2str(min_size(j)));
        mkdir(outDira);
        regionBench2(imgDir, gtDir, pbDira, outDira, nthresh);
    end
end
    
toc;
