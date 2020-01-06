addpath benchmarks
clear all;close all;clc;
%% 5. Test region benchmarks for results stored as a cell of segmentations:

imgDir = 'data/BSDS500/images';
gtDir = 'data/BSDS500/groundTruth';
inDir = 'data/BSDS500/sp_gn/';
outDir = 'tests/test_region_sp_gn';
mkdir(outDir);
nthresh = 5;

tic;
regionBench2(imgDir, gtDir, inDir, outDir, nthresh);
toc;