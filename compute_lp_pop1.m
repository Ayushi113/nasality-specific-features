

% get a section of vowel
function[output]=compute_lp_pop1(frame,fs)
%[frame,fs]=wavread('/home/nash/ayushi/Projects_2016/nasals_Jan16/data/abd_0.wav',[40000 50000]);
ms20=fs/50;                 % minimum speech Fframe at 50Hz
ncoeff1=2+fs/1000;           % rule of thumb for formant estimation
a=lpc(frame,ncoeff1);
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=lpc(frame,5*ncoeff1);
[h1,f1]=freqz(1,a1,512,fs);
h1=abs(20*log10(h1));
rts1=roots(a1);                  % find roots of polynomial a
rts1 = rts1(imag(rts1)>=0.01);
angz1 = atan2(imag(rts1),real(rts1));
[frqs1,indices1] = sort(angz1.*(fs/(2*pi)));
bw = -1/2*(fs/(2*pi))*log(abs(rts1(indices)));

for kk = 1:length(frqs1)
        nasformants(kk) = frqs1(kk);
end

for ii=1:length(formnt)
    
 [~,loc1]=min(abs(formnt_loc(ii)-nasformants));
 nasformants_loc(ii)=nasformants(loc1);
 nasformants_amp(ii)=(abs(h1(loc1)));
end




for ii=1:length(formnt)
 [~,loc1]=min(abs(nasformants_loc(ii)-f));
 fff_loc(ii)=f(loc1);
 fff_amp(ii)=abs(h1(loc1));
end

indd=find(f==fff_loc(1));
if (indd-4<=1)
    po=0;
    po_freq=0;
else
[po,poloc]=max(abs(h1(1:indd-4)));
    
po_freq=f(poloc);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indd2=find(f==fff_loc(2));
if (indd2-2<=indd)
 p1=0;
 p1_freq=0;
else
[p1,p1loc]=max(abs(h1(indd+1:indd2-1)));
   p1index=indd+1:indd2-1;

 p1_freq=f(p1index(p1loc));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%making_arrays

output=([nasformants_loc,nasformants_amp,po,po_freq,p1,p1_freq]);
end