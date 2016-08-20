% get a section of vowel

[x,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 50000]);
ms20=fs/50;                 % minimum speech Fx at 50Hz

%
%obw(x, fs)
% plot waveform
ncoeff=2+fs/1000;           % rule of thumb for formant estimation

a=lpc(x,ncoeff);

[h,f]=freqz(1,a,512,fs);

subplot(2,1,2);

plot(f,20*log10(abs(h)+eps));

legend('LP Filter');

xlabel('Frequency (Hz)');

ylabel('Gain (dB)');

rts=roots(a);                  % find roots of polynomial a

rts = rts(imag(rts)>=0.01);
angz = atan2(imag(rts),real(rts));

[frqs,indices] = sort(angz.*(fs/(2*pi)));

bw = -1/2*(fs/(2*pi))*log(abs(rts(indices)));
bw
nn = 1;
for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) <400)
        formants(nn) = frqs(kk);
        nn = nn+1;
    end
end
formants



