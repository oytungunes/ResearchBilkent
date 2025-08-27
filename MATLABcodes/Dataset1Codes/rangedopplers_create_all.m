clear all
close all
clc

%% create fast and slow range doppler data all
tic
fs=1e7;
resizedim=100;
numoffolder=57;

 %  addpath '/Users/oytungunes/Desktop/RESEARCH2025/Dataset2';


   %% fast
   range_doppler_swp=zeros(resizedim,resizedim, numoffolder);
   index=1;
   for ii=1:numoffolder
    ii
  %load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/',num2str(ii),'/adc_Data.mat']);
  % load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/',num2str(ii),'/adc_Data.mat']);
   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOWWITHPOCKETS/',num2str(ii),'/adc_Data.mat']);

    adcDataRX1 = adc_DataTable.adc_DataRX1; 
    adcDataRX2 = adc_DataTable.adc_DataRX2; 
    adcDataRX3 = adc_DataTable.adc_DataRX3; 
    adcDataRX4 = adc_DataTable.adc_DataRX4; 

    adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
    adcMatrix = reshape(adcData, 512, []);
    RDM = fft2(adcMatrix);                            % Range + Doppler FFT
    RDM_dB = 20*log10(abs(fftshift(RDM))); % Convert to dB scale


    % image resize as in the paper
    rangedoppler_resized = imresize(RDM_dB,[resizedim,resizedim],'bicubic');

    range_doppler_swp(:,:,index) = rangedoppler_resized;

   index=index+1;
   end  

save('range_doppler_swp.mat','range_doppler_swp');
range_doppler_swp_label=2.*ones(size(range_doppler_swp,3),1);
save('range_doppler_swp_label.mat','range_doppler_swp_label');

%%
%   range_doppler_slow=zeros(resizedim,resizedim, numoffolder);
%    index=1;
%    for ii=1:numoffolder
%     ii
% %   load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/',num2str(ii),'/adc_Data.mat']);
%    load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/',num2str(ii),'/adc_Data.mat']);
% 
%     adcDataRX1 = adc_DataTable.adc_DataRX1; 
%     adcDataRX2 = adc_DataTable.adc_DataRX2; 
%     adcDataRX3 = adc_DataTable.adc_DataRX3; 
%     adcDataRX4 = adc_DataTable.adc_DataRX4; 
% 
%     adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
%     adcMatrix = reshape(adcData, 512, []);
%     RDM = fft2(adcMatrix);                            % Range + Doppler FFT
%     RDM_dB = 20*log10(abs(fftshift(RDM))); % Convert to dB scale
% 
% 
%     % image resize as in the paper
%     rangedoppler_resized = imresize(RDM_dB,[resizedim,resizedim],'bicubic');
% 
%     range_doppler_slow(:,:,index) = rangedoppler_resized;
% 
%    index=index+1;
%    end  
% 
% save('range_doppler_slow.mat','range_doppler_slow');
% range_doppler_slow_label=zeros(size(range_doppler_slow,3),1);
% 
% 
% % save labels
% save('range_doppler_slow_label.mat','range_doppler_slow_label');
% 
% 
% 

