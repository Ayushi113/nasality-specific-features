%Center frequency for each frame given by 40000, 50000
[x,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 50000]);
ms20=fs/50;                 % minimum speech Fx at 50Hz

%
%obw(x, fs)
% plot waveform
ncoeff=2+fs/1000;           % rule of thumb for formant estimation

a=lpc(x,ncoeff);

[h,f]=freqz(1,a,512,fs);
h = abs(log(h))
indices = [1:512]
center_frequency = round(dot(h, f)/sum(h))
