%Center frequency for each frame given by 40000, 50000
function[center_frequency,stdev]=spectral_centroid_v2(frame,fs)


%[frame,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 50000]);

ms20=fs/50;                 % minimum speech Fframe at 50Hz

%
%obw(frame, fs)
% plot waveform
ncoeff=2+fs/1000;           % rule of thumb for formant estimation

a=lpc(frame,ncoeff);

[amp,freq]=freqz(1,a,512,fs);
amp = abs(log(amp));
indices = [1:512];
center_frequency = round(dot(amp, freq)/sum(amp));
A = [];
for i = 1:512
    var = (amp(i) - center_frequency)^2;
    A = [A;var];
    
end

stdev = round(sqrt(sum(A)/sum(indices)));
end