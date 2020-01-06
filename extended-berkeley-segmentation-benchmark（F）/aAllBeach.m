addpath benchmarks
clear all;close all;clc;
%% 5. Test region benchmarks for results stored as a cell of segmentations:

imgDir = 'data/BSDS500/images';
gtDir = 'data/BSDS500/groundTruth';
inDir = 'data/BSDS500/align-hier';
outDir = 'tests/test_align-hier';
mkdir(outDir);
nthresh = 5;

tic;
allBench(imgDir, gtDir, inDir, outDir, nthresh);
toc;