clear all;
filename = './tests/test_region_sp_350000_0.00001_1000_100/eval_cover_img.txt';
infors = textread(filename);
k =length(infors);
allF = 0;
OIS = 0;
OISid = 0;
 for z=1:1:k
    infor = infors(z,5);
    allF = allF + infor;
    if infor > OIS
        OIS = infor;
        OISid = z;
    end
 end
 
 ODS = allF/200;

 score = [ODS,OIS];
 fname = 'region.txt';
 fid = fopen(fname,'w');
 dlmwrite(fname,score,'-append');