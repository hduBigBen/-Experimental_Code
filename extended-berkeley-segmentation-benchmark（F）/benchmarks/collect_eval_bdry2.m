function [bestF, bestP, bestR, bestT, F_max, P_max, R_max, Area_PR] = collect_eval_bdry2(pbDir)
% function [bestF, bestP, bestR, bestT, F_max, P_max, R_max, Area_PR ] = collect_eval_bdry(pbDir)
%
% Calculate P, R and F-measure from individual evaluation files.
%
% Creates the following files: eval_bdry.txt, eval_bdry_img.txt,
% eval_bdry_thr.txt. Details on these files can be found in README.md.
%
% INPUT:
%   pbDir:      directory containing temporary evaluation files
%
% OUTPUT:
%   bestF:      best F-measure over all ground truth segmentations after
%               averaging over the individual images
%   bestP:      corresponding Boundary Precision
%   bestR:      corresponding Boundary Recall
%   bestT:      the corresponding ground truth index
%   F_max:      average F-measure over all images after maximizing over the
%               individual ground truth segmentations
%   P_max:      corresponding Boundary Precision
%   R_max:      corresponding Boundary Recall
%
% Pablo Arbelaez <arbelaez@eecs.berkeley.edu>
% Updated by David Stutz <david.stutz@rwth-aachen.de>


    fname = fullfile(pbDir, '_eval_bdry.txt');
    if length(dir(fname)) == 1
        tmp = dlmread(fname); 
        bestT = tmp(1);
        bestR = tmp(2);
        bestP = tmp(3);
        bestF = tmp(4);
        R_max = tmp(5);
        P_max = tmp(6);
        F_max = tmp(7);
        Area_PR = tmp(8);
    else
        S = dir(fullfile(pbDir,'*_ev1.txt'));

        % deduce nthresh from .pr files
        filename = fullfile(pbDir,S(1).name);
        AA = dlmread(filename); % thresh cntR sumR cntP sumP

        thresh = AA(:,1);
        
        F_best = 0;
        
        
        scores = zeros(length(S),5);

        for i = 1:length(S)

            iid = S(i).name(1:end-8);

            filename = fullfile(pbDir,S(i).name);
            AA  = dlmread(filename);
            cntR = AA(:, 2);
            sumR = AA(:, 3);
            cntP = AA(:, 4);
            sumP = AA(:, 5);

            R = cntR ./ (sumR + (sumR==0));
            P = cntP ./ (sumP + (sumP==0));
            F = fmeasure(R,P);
            
            if F > F_best
                F_best = F;
            end

            [bestT,bestR,bestP,bestF] = maxF(thresh,R,P);
            scores(i,:) = [i bestT bestR bestP bestF];     

        end 
        fname = fullfile(pbDir,'_eval_bdry_img.txt');
        fid = fopen(fname,'w');
        if fid==-1
            error('Could not open file %s for writing.',fname);
        end
        fprintf(fid,'%10d %10g %10g %10g %10g\n',scores');
        fclose(fid);
               
   
        % best value
        txtName = strcat('best_bdry.txt');        
        fname = fullfile(pbDir,txtName);
        dlmwrite(fname,F_best,'-append');
    end
end

% compute f-measure from recall and precision
function [f] = fmeasure(r,p)
    f = 2*p.*r./(p+r+((p+r)==0));
end

% interpolate to find best F and coordinates thereof
function [bestT,bestR,bestP,bestF] = maxF(thresh,R,P)
    bestT = thresh(1);
    bestR = R(1);
    bestP = P(1);
    bestF = fmeasure(R(1),P(1));
    % numel(thresh) = 1 bu zhi xing xia mian de cheng xu 
    for i = 2:numel(thresh)
        for d = linspace(0,1)
            t = thresh(i)*d + thresh(i-1)*(1-d);
            r = R(i)*d + R(i-1)*(1-d);
            p = P(i)*d + P(i-1)*(1-d);
            f = fmeasure(r,p);
            if f > bestF
                bestT = t;
                bestR = r;
                bestP = p;
                bestF = f;
            end
        end
    end
end