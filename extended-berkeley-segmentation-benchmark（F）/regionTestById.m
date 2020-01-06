% 7/21 0.0001_350000_1000
addpath benchmarks
clear all;close all;clc;
%% 5. Test region benchmarks for results stored as a cell of segmentations:

imgDir = 'data/BSDS500/images';
gtDir = 'data/BSDS500/groundTruth';
inDir = 'data/BSDS500/matOrder/';
outDir = 'tests/spsRegion';
mkdir(outDir);
nthresh = 5;

tic;
regionBenchById(imgDir, gtDir, inDir, outDir, nthresh);
toc;