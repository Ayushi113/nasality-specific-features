clc;
close all;
clear all;
spath='../scripts/textgrids_wav/*.wav';
tpath='../scripts/feats_maxamp';
a=dir(spath);
maxamp=[];

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
  [mxamp]=maxamp_peaks(frame,fs);
 
  maxamp=[maxamp; mxamp];
           
end
M=maxamp; 
[str,tok]=strtok(a(i).name,'.');
outname=fullfile(tpath,strcat(str,'.txt'))
dlmwrite(outname,M, 'delimiter', '\t', 'precision', 6)
%type myfile.txt
end