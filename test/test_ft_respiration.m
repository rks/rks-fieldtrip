function test_ft_respiration


% MEM 2gb
% WALLTIME 00:10:00
% DEPENDENCY ft_respiration

fs = 500;
nchan = 32;
start_time = -1; %s
end_time = 2.5; %s
nsamples = (end_time - start_time) * fs + 1;

data = [];
data.time{1} = linspace(start_time, end_time, nsamples);
data.trial{1} = randn(nchan,nsamples);
data.label = cellstr(num2str((1:nchan).'));
data.sens.label = data.label;
data.sens.chanpos = randn(nchan,3);
data.sens.elecpos = data.sens.chanpos;
data.sens.tra = eye(nchan);

cfg = [];
cfg.channel = '11';
cfg.peakseparation = 1;
cfg.envelopewindow = 0.5;
cfg.feedback = 'no';
dataout = ft_respiration(cfg,data);