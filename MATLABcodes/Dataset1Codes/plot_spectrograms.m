  
clear all;clc
   index=4;
   fs=1e7;
   resizedim=100;


   addpath '/Users/oytungunes/Desktop/RESEARCH2025/Dataset2'

   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/',num2str(index)','/adc_Data.mat']);

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
    spectrogram_resized1 = imresize(spect2,[resizedim,resizedim],'bicubic');
    figure
    imagesc(spectrogram_resized1)