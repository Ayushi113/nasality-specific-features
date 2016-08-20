% get a section of vowel

 [x,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 50000]);
 ms20=fs/50;                 % minimum speech Fx at 50Hz
 

 ncoeff = 100+fs/1000;           % rule of thumb for formant estimation
 finer_pol = lpc(x, ncoeff)
 [amp_fin, freq_fin] = freqz(1,finer_pol,8000,fs);
 [peaks_amp, peaks_loc]  = findpeaks(abs(amp_fin))
 peaks_loc(1)
 
 subplot(2,1,2);
 plot(freq_fin, 20*log10(abs(amp_fin)+eps));
 legend('LP Filter FN');
 xlabel('Frequency FN (Hz)');
 ylabel('Gain FN(dB)');
 
 rts_fin = roots(finer_pol);                  % find roots of polynomial a
 rts_fin = rts_fin(imag(rts_fin)>=0.01);
 angz_fin = atan2(imag(rts_fin),real(rts_fin));
[frqs_fin,indices_fin] = sort(angz_fin.*(fs/(2*pi)));
 length(frqs_fin)
 %findpeaks()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$
%%%%%%%%%%%%% smoother polynomial%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  ncoeff_sm = 2 + fs/1000;
%  smoother_pol=lpc(x,ncoeff_sm);
% [amp_sm, freq_sm] = freqz(1,smoother_pol,512,fs);
% 
%  subplot(2,1,2);
%  
%  plot(freq_sm, 20*log10(abs(amp_sm)+eps));
%  legend('LP Filter SM');
%  xlabel('Frequency SM (Hz)');
%  ylabel('Gain SM(dB)');
%  rts_sm=roots(smoother_pol);                  % find roots of polynomial a
%  rts_sm = rts_sm(imag(rts_sm)>=0.01);
%  angz_sm = atan2(imag(rts_sm),real(rts_sm));
%  
%  [frqs_sm,indices_sm] = sort(angz_sm.*(fs/(2*pi)));
%  length(frqs_sm)
