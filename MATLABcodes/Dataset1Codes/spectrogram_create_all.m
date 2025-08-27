clear all
close all
clc


tic
fs=1e7;
resizedim=100;
numoffolder=57;  
indexdesired=[1:49,49,51:57];  % for fast, since 50th data is NaN




   addpath '/Users/oytungunes/Desktop/RESEARCH2025/Dataset2';

   spectrogram_swp=zeros(resizedim,resizedim, numoffolder);
   spectrogramindex=1;
   for ii=1:numoffolder
   myindex= indexdesired(ii);
   ii
  %load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/',num2str(myindex),'/adc_Data.mat']);
  % load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/',num2str(ii),'/adc_Data.mat']);
   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOWWITHPOCKETS/',num2str(ii),'/adc_Data.mat']);

    adcDataRX1 = adc_DataTable.adc_DataRX1; 
    adcDataRX2 = adc_DataTable.adc_DataRX2; 
    adcDataRX3 = adc_DataTable.adc_DataRX3; 
    adcDataRX4 = adc_DataTable.adc_DataRX4; 

    adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
    adcMatrix = reshape(adcData, 512, []);
    RangeMatrix = fft(adcMatrix);

    [spect,f,t,p] = spectrogram(RangeMatrix(1, :), 512, 256, 512,fs,'centered','yaxis');
    
    for a = 2 : 512
        [s,f,t,p] = spectrogram(RangeMatrix(a, :), 512, 256, 512,fs,'centered','yaxis'); 
        spect = spect + s;
    
    end
   spect2= helperPreprocess(spect);

    % image resize as in the paper
    spectrogram_resized = imresize(spect2,[resizedim,resizedim],'bicubic');

    spectrogram_swp(:,:,ii) = spectrogram_resized;
   end
% 
save('spectrogram_swp.mat','spectrogram_swp');
spectrogram_swp_label=2.*ones(size(spectrogram_swp,1),1);
save('spectrogram_swp_label.mat','spectrogram_swp_label');

% save('spectrogram_slow_resized.mat','spectrogram_slow_resized');
% spectrogram_slow_label=zeros(size(spectrogram_slow_resized,3),1);
% save('spectrogram_slow_label.mat','spectrogram_slow_label');

toc