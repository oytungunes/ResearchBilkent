clear all
close all
clc
%% fast data
fs=1e7;
resizedim=100;
   % 
   % addpath '/Users/oytungunes/Desktop/RESEARCH2025/Dataset2'
   % 
   % load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/1/adc_Data.mat']);
   % 
   %  adcDataRX1 = adc_DataTable.adc_DataRX1; 
   %  adcDataRX2 = adc_DataTable.adc_DataRX2; 
   %  adcDataRX3 = adc_DataTable.adc_DataRX3; 
   %  adcDataRX4 = adc_DataTable.adc_DataRX4; 
   % 
   %  adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
   %  adcMatrix = reshape(adcData, 512, []);
   %  RangeMatrix = fft(adcMatrix);
   % 
   %  [spect,f,t,p] = spectrogram(RangeMatrix(1, :), 512, 256, 512,fs,'centered','yaxis');
   % 
   %  for a = 2 : 512
   %      [s,f,t,p] = spectrogram(RangeMatrix(a, :), 512, 256, 512,fs,'centered','yaxis'); 
   %      spect = spect + s;
   % 
   %  end
   % spect2= helperPreprocess(spect);
   % 
   %  % image resize as in the paper
   %  spectrogram_resized1 = imresize(spect2,[resizedim,resizedim],'bicubic');

    %%


   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/2/adc_Data.mat']);

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
    spectrogram_resized2 = imresize(spect2,[resizedim,resizedim],'bicubic');
    doppler = linspace(-8000,8000,size(spect2,1));    
    time=linspace(0,16,size(spect2,2));

    % imagesc(time,doppler,spectrogram_resized1)
    % xlabel('Time(s)');
    % ylabel('Frequency(Hz)')
    % 
    % a=colorbar;
    % 
    %  set(gca,'Fontsize',16)
    %  set(gca,'YtickLabel',[8000:-2000:-8000])
    %   ylabel(a,'Power (dB)','FontSize',16,'Rotation',270);
    % 
    % saveas(gcf,'Spectrogramfast','epsc')
     figure
    imagesc(time,doppler,spectrogram_resized2)
    set(gca,'Fontsize',16)

     xlabel('Time(s)');
    ylabel('Frequency(Hz)')
     a=colorbar;
    ylabel(a,'Power (dB)','FontSize',16,'Rotation',270);
    colorbar
    set(gca,'YtickLabel',[8000:-2000:-8000])
    saveas(gcf,'Spectrogramslow','epsc')

    %%
    clear all
fs=1e7;
resizedim=100;


   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOWWITHPOCKETS/10/adc_Data.mat']);

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
    spectrogram_resized2 = imresize(spect2,[resizedim,resizedim],'bicubic');
    doppler = linspace(-8000,8000,size(spect2,1));    
    time=linspace(0,16,size(spect2,2));

    imagesc(time,doppler,spectrogram_resized2)

    set(gca,'FontSize',16)

     xlabel('Time(s)');
    ylabel('Frequency(Hz)')
     a=colorbar;
    ylabel(a,'Power (dB)','FontSize',16,'Rotation',270);
    set(gca,'YtickLabel',[8000:-2000:-8000])
    saveas(gcf,'Spectrogramswp','epsc')









