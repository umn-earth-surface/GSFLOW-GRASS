% write_nam_MOD
% 11/20/16

clear all, close all, fclose all;

% - directories
% MODFLOW input files
GSFLOW_indir = '/home/gcng/workspace/ProjectFiles/AndesWaterResources/GSFLOW/inputs/MODFLOW';
% MODFLOW output files
GSFLOW_outdir = '/home/gcng/workspace/ProjectFiles/AndesWaterResources/GSFLOW/outputs/MODFLOW/';

% - write to this file (within indir)
fil_nam = 'test.nam';
slashstr = '/';

% all assumed to be in GSFLOW_dir
fil_ba6 = 'test1lay.ba6';
fil_lpf = 'test1lay.lpf';
fil_pcg = 'test.pcg';
fil_oc = 'test.oc';
fil_dis = 'test1lay.dis';
fil_uzf = 'test.uzf';
fil_sfr = 'test.sfr';

%% ------------------------------------------------------------------------

% -- .nam file with full paths
% fil_nam_0 = fullfile(MODtest_dir0, fil_nam);
fil_nam_0 = [GSFLOW_indir, slashstr, fil_nam];
fid = fopen(fil_nam_0, 'wt');
fprintf(fid, 'LIST          7 %s \n', [GSFLOW_outdir, slashstr, 'test.lst']); % MODFLOW output file
fprintf(fid, 'BAS6          8 %s \n', [GSFLOW_indir, slashstr, fil_ba6]);
fprintf(fid, 'LPF          11 %s \n', [GSFLOW_indir, slashstr, fil_lpf]);
fprintf(fid, 'PCG          19 %s \n', [GSFLOW_indir, slashstr, fil_pcg]);
fprintf(fid, 'OC           22 %s \n', [GSFLOW_indir, slashstr, fil_oc]);
fprintf(fid, 'DIS          10 %s \n', [GSFLOW_indir, slashstr, fil_dis]);
fprintf(fid, 'UZF          12 %s \n', [GSFLOW_indir, slashstr, fil_uzf]);
fprintf(fid, 'SFR          13 %s \n', [GSFLOW_indir, slashstr, fil_sfr]);
fprintf(fid, 'DATA(BINARY) 34 %s \n', fullfile(GSFLOW_outdir, 'test.bud')); % MODFLOW LPF output file, make sure 34 is unit listed in lpf file!!
fprintf(fid, 'DATA(BINARY) 51 %s \n', [GSFLOW_outdir, slashstr, 'testhead.dat']); % MODFLOW output file
fprintf(fid, 'DATA(BINARY) 61 %s \n', [GSFLOW_outdir, slashstr, 'uzf.dat']); % MODFLOW output file
fprintf(fid, 'DATA         52 %s \n', [GSFLOW_outdir, slashstr, 'ibound.dat']); % MODFLOW output file

fclose(fid);
