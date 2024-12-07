
% ini1 = 1;
% ini2 = 1;
% for ini = 1:15
%     ini1
%%Loading of Datasets
%
[file1,path1] = uigetfile('*.*','Select Signal');
Name1 = [path1,file1];
load(Name1)
x = val(1,:);
%     ini2
[file2,path2] = uigetfile('*.*','Select Signal');
Name2 = [path2,file2];
load(Name2)
y = val(1,:);
% load('slp01am.mat')
% z = val(1,:);
fs = 250;
tx = 0:(1/fs):(length(x)-1)/fs;
figure;
plot(tx,x);
xlabel('Time in Secs');
ylabel('Amplitude in mV');
title('ECG Signal');
ty = 0:(1/fs):(length(y)-1)/fs;
figure;
plot(ty,y);
xlabel('Time in Secs');
ylabel('Amplitude in mV');
title('PPG Signal');
% tz = 0:(1/fs):(length(z)-1)/fs;
% figure;
% plot(tz,z);
% xlabel('Time in Secs');
% ylabel('Amplitude in mV');
% title('ECG Signal');

%%Feature Extraction
%BPM calculation from ECG signal
[pks,locs] = findpeaks(x);
bpm = length(pks)/6;
% BPM(ini) = bpm;

%Heart rate from PPG signal
[pksp,locsp] = findpeaks(y,'MinPeakDistance',300);
% if ini <= 10
hrt = length(pksp)*25;
% else
% hrt = length(pksp)*50;
% end
% HRT(ini) = hrt;
% ini1 = ini1+1;ini2 = ini2+1;
% end

% figure;
% findpeaks(y,'MinPeakDistance',300);

%%ANN Classification
%Training
%Features
load('BPM.mat')

%Labels
load('labels1.mat')

%Training with ECG Signals
input1 = BPM;
correct_Output1 = labels1;

Weight1 = 2*rand(1,1)-1;
for epoch = 1:10
    Weight1 = SGD_method(Weight1, input1, correct_Output1);
end

save('Trained_Network1.mat')

