% get a section of vowel
function [formnt_loc,formant_amp]=compute_lp_formants(frame,fs)
%[frame,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 50000]);
ms20=fs/50;                 % minimum speech Fframe at 50Hz

ncoeff=2+fs/1000;           % rule of thumb for formant estimation

a=lpc(frame,ncoeff);

[h,f]=freqz(1,a,512,fs);

rts=roots(a);                  % find roots of polynomial a

rts = rts(imag(rts)>=0.01);
angz = atan2(imag(rts),real(rts));


[frqs,indices] = sort(angz.*(fs/(2*pi)));

bw = -1/2*(fs/(2*pi))*log(abs(rts(indices)));


for kk = 1:length(frqs)
          formants(kk) = frqs(kk);
 end

formnt= formants(1:4);
%end
for ii=1:length(formnt)
    [~,loc]=min(abs(f-formnt(ii)));
    formnt_loc(ii)=f(loc);
    formant_amp(ii)=abs(h(loc));
end



