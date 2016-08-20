clc;
close all;
clear all;
spath='../scripts/textgrids_wav/*.wav';
tpath='../scripts/feats_centroid';
a=dir(spath);
centroid=[];
std=[];
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
    [center_frequency,stdev]=spectral_centroid_v2(frame,fs);
    %round(center_frequency)
    %round(stdev)
   
    centroid=[centroid center_frequency];
    
    std=[std stdev];
  
    
end
M=[centroid;std]'; 
[str,tok]=strtok(a(i).name,'.');
outname=fullfile(tpath,strcat(str,'.txt'))
dlmwrite(outname,M, 'delimiter', '\t', 'precision', 6)
%type myfile.txt
end
%[center_frequency,stdev]=spectral_centroid_v2(frame,fs)