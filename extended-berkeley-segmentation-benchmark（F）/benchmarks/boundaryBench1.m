function boundaryBench1(imgDir, gtDir, outDir, nthresh, maxDist, thinpb)
% function boundaryBench(imgDir, gtDir, pbDir, outDir, nthresh, maxDist, thinpb)
%
% Run boundary benchmark (precision/recall curve) on dataset.
%
% INPUT
%   imgDir: folder containing original images
%   gtDir:  folder containing ground truth data.
%   pbDir:  folder containing boundary detection results for all the images in imgDir. 
%           Format can be one of the following:
%             - a soft or hard boundary map in PNG format.
%             - a collection of segmentations in a cell 'segs' stored in a mat file
%             - an ultrametric contour map in 'doubleSize' format, 'ucm2' stored in a mat file with values in [0 1].
%   outDir: folder where evaluation results will be stored
%	nthresh	: Number of points in precision/recall curve.
%   MaxDist : For computing Precision / Recall.
%   thinpb  : option to apply morphological thinning on segmentation
%             boundaries before benchmarking.
%
% Based on boundaryBench by David Martin and Charless Fowlkes:
% http://www.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/segbench/code/Benchmark/boundaryBench.m
%
% Pablo Arbelaez <arbelaez@eecs.berkeley.edu>

    if nargin < 7
        thinpb = true;
    end
    if nargin < 6
        maxDist = 0.0075;
    end
    if nargin < 5
        nthresh = 99;
    end


    iids = dir(fullfile(imgDir,'*.jpg'));
    
    
    for i = 1:numel(iids)
        pbDir = strcat('data/BSDS500/sts_0.0001_350000_1000/',iids(i).name(1:end-4));  % mat文件夹 
        ids = dir(fullfile(pbDir,'*.mat'));
        
        
        for j = 1:numel(ids)
            
            evFile = fullfile(outDir, strcat(iids(i).name(1:end-4),num2str(j),'_ev1.txt'));
            if exist('evFile','file')
                continue;
            end
            
            inFile = fullfile(pbDir, strcat(iids(i).name(1:end-4),num2str(j),'.mat'));  % seg mat file
            gtFile = fullfile(gtDir, strcat(iids(i).name(1:end-4),'.mat'));  % gt mat file 
            evaluation_bdry_image(inFile,gtFile, evFile, nthresh, maxDist, thinpb);
        end
        collect_eval_bdry1(outDir,iids(i).name(1:end-4));
        delete(sprintf('%s/*_ev1.txt', outDir));
    end
end
    
    
    
    
    
%     for i = 1:numel(iids)
%         evFile = fullfile(outDir, strcat(iids(i).name(1:end-4),i,'_ev1.txt'));
%         if exist('evFile','file')
%             continue;
%         end
% 
%         inFile = fullfile(pbDir, strcat(iids(i).name(1:end-4),'.mat'));  % seg mat file
%         if ~exist(inFile,'file')
%             inFile = fullfile(pbDir, strcat(iids(i).name(1:end-4),'.png'));
%         end
% 
%         gtFile = fullfile(gtDir, strcat(iids(i).name(1:end-4),'.mat'));  % gt mat file 
%         evaluation_bdry_image(inFile,gtFile, evFile, nthresh, maxDist, thinpb);
%     end
% 
%     collect_eval_bdry(outDir);
    
    %delete(sprintf('%s/*_ev1.txt', outDir));

