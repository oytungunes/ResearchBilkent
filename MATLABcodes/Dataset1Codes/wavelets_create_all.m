clear all
close all
clc

%% define parameters
tic
fs=1e7;
resizedim=100;
numoffolder=57;
Tsweep=66e-6;
NTS=512;
numofchirpsforwavelet=3;

   %% fast
   wavelet_fast=zeros(resizedim,resizedim, numoffolder);
   index=1;
   for ii=1:numoffolder
    ii
   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/',num2str(ii),'/adc_Data.mat']);
  % load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/',num2str(ii),'/adc_Data.mat']);

    adcDataRX1 = adc_DataTable.adc_DataRX1; 
    adcDataRX2 = adc_DataTable.adc_DataRX2; 
    adcDataRX3 = adc_DataTable.adc_DataRX3; 
    adcDataRX4 = adc_DataTable.adc_DataRX4; 

    adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
 

    t = 0:1/fs:numofchirpsforwavelet*Tsweep;         % Time vector
    [cfs, f] = cwt(adcData(1:numofchirpsforwavelet*NTS), 'morse', fs);   % 'morse' is the Morlet wavelet


    % image resize as in the paper
    wavelet_resized = imresize(abs(cfs(:,:,1)),[resizedim,resizedim],'bicubic');

    wavelet_fast(:,:,index) = wavelet_resized;

   index=index+1;
   end  

save('wavelet_fast.mat','wavelet_fast');
wavelet_fast_label=ones(size(wavelet_fast,3),1);
save('wavelet_fast_label.mat','wavelet_fast_label');


%% slow

   wavelet_slow=zeros(resizedim,resizedim, numoffolder);
   index=1;
   for ii=1:numoffolder
    ii
 %  load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/',num2str(ii),'/adc_Data.mat']);
  load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/',num2str(ii),'/adc_Data.mat']);

    adcDataRX1 = adc_DataTable.adc_DataRX1; 
    adcDataRX2 = adc_DataTable.adc_DataRX2; 
    adcDataRX3 = adc_DataTable.adc_DataRX3; 
    adcDataRX4 = adc_DataTable.adc_DataRX4; 

    adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
 

    t = 0:1/fs:numofchirpsforwavelet*Tsweep;         % Time vector
    [cfs, f] = cwt(adcData(1:numofchirpsforwavelet*NTS), 'morse', fs);   % 'morse' is the Morlet wavelet


    % image resize as in the paper
    wavelet_resized = imresize(abs(cfs(:,:,1)),[resizedim,resizedim],'bicubic');

    wavelet_slow(:,:,index) = wavelet_resized;

   index=index+1;
   end  

save('wavelet_slow.mat','wavelet_slow');
wavelet_slow_label=zeros(size(wavelet_slow,3),1);
save('wavelet_slow_label.mat','wavelet_slow_label');
