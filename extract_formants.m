clc;
close all;
clear all;
spath='../scripts/textgrids_wav/*.wav';
tpath='../scripts/feats_formants';
a=dir(spath);
formant=[];
formant_amp=[];
for i=1:length(a)
fname=fullfile('textgrids_wav',a(i).name);
[wav,fs]=wavread(fname);
framesize_ms=20;
frameshift_ms=10;
framesize=framesize_ms*fs/1000;
frameshift=frameshift_ms*fs/1000;
overlap=framesize-frameshift;
yf=buffer(wav,framesize,overlap);
for j=1:size(yf,2)
    frame=yf(:,j);
    %[center_frequency,formant_ampev]=spectral_centroid_v2(frame,fs);
     [formnt_loc,formnt_amp]=compute_lp_formants(frame,fs)
    %round(center_frequency)
    %round(formant_ampev)
   
    formant=[formant;formnt_loc];
    
    size(formant)
        
    formant_amp=[formant_amp;formnt_amp];
  
    
end
M=[formant formant_amp]; 
[str,tok]=strtok(a(i).name,'.');
outname=fullfile(tpath,strcat(str,'.txt'))
dlmwrite(outname,M, 'delimiter', '\t', 'precision', 6)
%type myfile.txt
end