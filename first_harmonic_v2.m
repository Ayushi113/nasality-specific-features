% get a section of vowel

[signal,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 40320]);

ms0=fs/50;                 % minimum speech Fx at 50Hz
F_transform = fft(signal, 1024);
F_transform = abs(20*log(abs(F_transform(1:512))));% only retaining the positive frequencies



%peaks_freq = [0:fs/N:fs-1/N]
%plot(peaks_freq, F_transform)

[peaks_amp, peaks_loc]  = findpeaks(F_transform);

aaa=find(peaks_amp<40);
peaksggt40=peaks_amp(aaa);
locgt40=peaks_loc(aaa);

for ii=1:length(locgt40)
    loc=locgt40(ii);
    amploc=peaks_amp(loc); 
    
    
    %(loc-3:loc+3)
end








% 
% 
% 
% 
% 
% peaks_loc
% peaks_freq = peaks_loc*fs/(length(F_transform))
% plot(peaks_freq, 20*log10(abs(peaks_amp)+eps));
% 
% % [~,maxindex] = max(abs(F_transform));
% %  
% %  F_transform = smooth(abs(fft(signal, 512)), 5)
% %  [peaks_amp, peaks_loc]  = findpeaks(abs(F_transform))
% %  sorted_DFT = sort(20*log10(abs(peaks_loc)))
% %  sorted_DFT(1)
% % subplot(2,1,2);
% % plot(peaks_loc, 20*log10(abs(peaks_amp)+eps));
% % legend('DFT Filter');
% % xlabel('Frequency DFT (Hz)');
% % ylabel('Gain DFT(dB)');
% %  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$
% %%%%%%%%%%%%% smoother polynomial%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%   ncoeff_sm = 2 + fs/1000;
%   smoother_pol=lpc(signal, ncoeff_sm);
%  [amp_sm, freq_sm] = freqz(1,smoother_pol,512,fs);
%   sorted_LPC = sort(20*log10(abs(amp_sm)));
%   sorted_LPC(1);
%   %subplot(2,1,2);
% %   plot(freq_sm, 20*log10(abs(amp_sm)+eps));
% %   legend('LP Filter SM');
% %   xlabel('Frequency SM (Hz)');
% %   ylabel('Gain SM(dB)');
% %   rts_sm=roots(smoother_pol);                  % find roots of polynomial a
% %   rts_sm = rts_sm(imag(rts_sm)>=0.01);
% %   angz_sm = atan2(imag(rts_sm),real(rts_sm));
% %   [frqs_sm,indices_sm] = sort(angz_sm.*(fs/(2*pi)));
% %   length(frqs_sm)
% 
%   
%   %A1_H1 = sorted_DFT(1) - sorted_LPC(1)
%   