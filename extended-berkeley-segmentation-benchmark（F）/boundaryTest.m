% 7/21 0.0001_350000_1000
addpath benchmarks
clear all;close all;clc;

%% 3. Test boundary benchmark for results stored as a cell of segmentations:
% 作为分段单元存储的结果的测试边界基准：
imgDir = 'data/BSDS500/images';
gtDir = 'data/BSDS500/groundTruth';
pbDir = 'data/BSDS500/sp_gn';
outDir = 'tests/boundsts_0.0001_350000_1000';
mkdir(outDir);

nthresh = 99; % note: the code changes this to the actual number of segmentations
tic;
%boundaryBench(imgDir, gtDir, pbDir,outDir, nthresh);
boundaryBench1(imgDir, gtDir,outDir, nthresh);
toc;