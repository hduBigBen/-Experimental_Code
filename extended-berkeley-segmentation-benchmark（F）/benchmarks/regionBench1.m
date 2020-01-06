function regionBench1(imgDir, gtDir, inDir, outDir, nthresh)
% regionBench(imgDir, gtDir, inDir, outDir, nthresh)
%
% Run region benchmarks on dataset: Probabilistic Rand Index, Variation of
% Information and Segmentation Covering. 
%
% INPUT
%   imgDir: folder containing original images
%   gtDir:  folder containing ground truth data.
%   inDir:  folder containing segmentation results for all the images in imgDir. 
%           Format can be one of the following:
%             - a collection of segmentations in a cell 'segs' stored in a mat file
%             - an ultrametric contour map in 'doubleSize' format, 'ucm2' stored in a mat file with values in [0 1].
%   outDir: folder where evaluation results will be stored
%	nthresh	: Number of points in precision/recall curve.
%
% Pablo Arbelaez <arbelaez@eecs.berkeley.edu>

    if nargin < 5
        nthresh = 99;
    end;

    iids = dir(fullfile(imgDir,'*.jpg'));
    
    num = numel(iids);
    
    for i = 1 : numel(iids)
        
        
        inDirMat = strcat(inDir,iids(i).name(1:end-4));  % mat文件夹 
        ids = dir(fullfile(inDirMat,'*.mat'));
        
%         x =  numel(ids);
        
        for j = 1:numel(ids)
        
    
            inFile = fullfile(inDirMat, strcat(iids(i).name(1:end-4),num2str(j),'.mat'));
            gtFile = fullfile(gtDir, strcat(iids(i).name(1:end-4), '.mat'));
            evFile2 = fullfile(outDir, strcat(iids(i).name(1:end-4),num2str(j),'_ev2.txt'));
%             evFile3 = fullfile(outDir, strcat(iids(i).name(1:end-4),num2str(j),'_ev3.txt'));

            evaluation_reg_image1(inFile, gtFile, evFile2, nthresh);

        end
        collect_eval_reg1(outDir,iids(i).name(1:end-4));

        delete(sprintf('%s/*_ev2.txt', outDir));
    end
end