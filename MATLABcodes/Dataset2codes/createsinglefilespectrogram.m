function [spectrogramdata] = createsinglefilespectrogram(datFiles,resizedim,activityindex)

N = length(datFiles) ; 
ii=1;



for i = 1:N
     thisFile = datFiles(i).name ; 
     if(thisFile(1)==activityindex) % 1 indicates walking and 6 indicates fall


     fileID = fopen(thisFile, 'r');
     dataArray = textscan(fileID, '%f');
     fclose(fileID);
     radarData = dataArray{1};

     % obtain basic info from radar data
    fc = radarData(1); % Center frequency
    Tsweep = radarData(2); % Sweep time in ms
    Tsweep=Tsweep/1000; %then in sec
    NTS = radarData(3); % Number of time samples per sweep
    Bw = radarData(4); % FMCW Bandwidth. For FSK, it is frequency step;
    % For CW, it is 0.
    IQData = radarData(5:end); % raw data in I+j*Q format
    fs=NTS/Tsweep; % sampling frequency ADC
    record_length=length(IQData)/NTS*Tsweep; % length of recording in s
    nc=record_length/Tsweep; % number of chirps


    adcMatrix = reshape(IQData, NTS, []);
        RangeMatrix = fft(adcMatrix);
        
        [spect,f,t,p] = spectrogram(RangeMatrix(1, :), (NTS), 125, NTS,fs,'centered','yaxis');
        
        for  a = 2 : NTS
        
            [s,f,t,p] = spectrogram(RangeMatrix(a, :), (NTS), 125, NTS,fs,'centered','yaxis'); 
            spect = spect + s;
        
        end
        
        spect2= helperPreprocess(spect);

% figure
% imagesc(MD.TimeAxis,MD.DopplerAxis.*3e8/2/5.8e9,20*log10(abs(Data_spec_MTI2))); colormap('jet'); axis xy
% ylim([-6 6]); colorbar
% colormap; %xlim([1 9])
% clim = get(gca,'CLim');
% set(gca, 'CLim', clim(2)+[-40,0]);
% xlabel('Time[s]', 'FontSize',16);
% ylabel('Velocity [m/s]','FontSize',16)
% set(gca, 'FontSize',16)

% image resize as in the paper
spectrogram_resized = imresize(spect2,[resizedim,resizedim],'bicubic');


% Rotated = rot90(range_doppler_resized);
% Rotated2= rot90(Rotated);

% figure
% imagesc(spectrogram_resized)

% fall
spectrogramdata(:,:,ii)=spectrogram_resized;

% walking
% spectrogram_walking(:,:,ii)=spectrogram_resized;  
% spectrogram_walking_label(ii)=0;%0 for walking and 1 for fall

% imagesc(Rotated2);
% 
% 
% xlabel('Doppler Frequency (Hz)');
% ylabel('Range (m)');
% title('Range-Doppler Map (FMCW, Doppler Frequency)');
% colorbar;
% axis xy;
ii=ii+1;
     else


     end
  


end

% % walking
% spectrogram_walking_label=spectrogram_walking_label';
% save('spectrogram_walking.mat','spectrogram_walking');
% save('spectrogram_walking_label.mat','spectrogram_walking_label');

%fall


end

