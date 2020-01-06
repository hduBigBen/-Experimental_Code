function [] = collect_eval_reg1(ucmDir,fileNum)
% function collect_eval_reg(ucmDir)
%
% Collect the evaluation of the region benchmark: Rand Index (RI),
% Variation of Information (VOI), and Segmentation Covering.
% 
% Creates the following files:
% - eval_RI_VOI.txt
% - eval_RI_VOI_thr.txt
% - eval_cover.txt
% - eval_cover_img.txt
% - eval_cover_th.txt
%
% Details on these files can be found in README.md.
%
% Pablo Arbelaez <arbelaez@eecs.berkeley.edu>
% Updated by David Stutz <david.stutz@rwth-aachen.de>

    fname = fullfile(ucmDir, 'eval_cover.txt');
    if length(dir(fname)) ~= 1
     
        S = dir(fullfile(ucmDir,'*_ev2.txt'));

        % deduce nthresh from files
        AA = dlmread(fullfile(ucmDir,S(1).name));
        scores = zeros(numel(S),5);
        F_best = 0;
        
        for i = 1:numel(S)

            iid = S(i).name(1:end-8);

            evFile1 = fullfile(ucmDir,S(i).name);
            tmp  = dlmread(evFile1);
            thresh = tmp(:, 1);
            cntR = tmp(:, 2);
            sumR = tmp(:, 3);
            cntP = tmp(:, 4);
            sumP = tmp(:, 5);

            % R contains the covering G_i -> S for each ground truth G_i
            R = cntR ./ (sumR + (sumR==0));
            % P contains the covering S -> G_i for each ground truth G_i
            P = cntP ./ (sumP + (sumP==0));

            [bestR ind] = max(R);
            bestT = thresh(ind(1));
            bestP = P(ind(1));
            F = fmeasure(bestR,bestP);
            
            if F > F_best
                F_best = F;
            end
            
            
            % R stands for the covering G -> S
            % P stands for the covering S -> G
            scores(i,:) = [i bestT bestR bestP F];
        end;
        
        txtName = strcat(fileNum,'eval_cover_img.txt');
        fname = fullfile(ucmDir,txtName);
        fid = fopen(fname,'w');
        if fid == -1
            error('Could not open file %s for writing.',fname);
        end;
        % scores contains the index, the ground truth index, the covering G ->
        % S and the convering S -> G in this order
        fprintf(fid,'%10d %10g %10g %10g %10g\n',scores);
        fclose(fid);
        
        
         % best value
        txtName = strcat('best_reg.txt');        
        fname = fullfile(ucmDir,txtName);
        dlmwrite(fname,F_best,'-append');
        
        
    end
end

% compute f-measure from recall and precision
function [f] = fmeasure(r,p)
    f = 2*p.*r./(p+r+((p+r)==0));
end



