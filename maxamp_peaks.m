% get a section of vowel
function [mxamp]=maxamp_peaks(frame,fs)
ncoeff=2+fs/1000;           % rule of thumb for formant estimation
a=lpc(frame,ncoeff);
[amp, freq] = freqz(1,a,512,fs);
abs_amp = abs(20*log10(amp));
sort_amp = sort(abs_amp);
max_amp = sort_amp(length(sort_amp));
A = [];
for i = 1:512
    if abs_amp(i) > (max_amp-4) 
       var = abs_amp(i);
       A = [A;var];
    end
end
mxamp = length(A);
end


