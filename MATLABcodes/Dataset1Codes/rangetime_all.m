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
   rangetime_fast=zeros(resizedim,resizedim, numoffolder);
   index=1;
   for ii=1:numoffolder
    ii
   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/',num2str(ii),'/adc_Data.mat']);

    adcDataRX1 = adc_DataTable.adc_DataRX1; 
    adcDataRX2 = adc_DataTable.adc_DataRX2; 
    adcDataRX3 = adc_DataTable.adc_DataRX3; 
    adcDataRX4 = adc_DataTable.adc_DataRX4; 

     adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
     adcMatrix = reshape(adcData, NTS, []);
     RangeTimeMatrix = fft(adcMatrix,[],2);

        
     rangetime=10*log10((abs(RangeTimeMatrix)));  % Magnitude in dB

    % image resize as in the paper
     rangetime_resized = imresize(rangetime,[resizedim,resizedim],'bicubic');

    % imagesc(rangetime_resized)
    
     rangetime_fast(:,:,index) = rangetime_resized;

     index=index+1;
   end  

save('rangetime_fast.mat','rangetime_fast');
rangetime_fast_label=ones(size(rangetime_fast,3),1);
save('rangetime_fast_label.mat','rangetime_fast_label');


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
    adcMatrix = reshape(adcData, NTS, []);
    RangeTimeMatrix = fft(adcMatrix,[],2);

        
     rangetime=10*log10(abs(RangeTimeMatrix));  % Magnitude in dB

    % image resize as in the paper
    rangetime_resized = imresize(rangetime,[resizedim,resizedim],'bicubic');

    imagesc(rangetime_resized)
    rangetime_slow(:,:,index) = rangetime_resized;

   index=index+1;
   end  

save('rangetime_slow.mat','rangetime_slow');
rangetime_slow_label=zeros(size(rangetime_slow,3),1);
save('rangetime_slow_label.mat','rangetime_slow_label');
