function [wavelet_data] = createsinglefilewavelet(datFiles,resizedim,activityindex)

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

     numofchirpsforwavelet=3;
    % t = 0:1/fs:numofchirpsforwavelet*Tsweep;         % Time vector
     [cfs, f] = cwt(IQData(1:numofchirpsforwavelet*NTS), 'morse', fs);   % 'morse' is the Morlet wavelet
     waveletdata=abs(cfs(:,:,1));

     waveletdata_resized = imresize(waveletdata,[resizedim,resizedim],'bicubic');

     %imagesc(waveletdata_resized);


        % walking
        wavelet_data(:,:,ii)=waveletdata_resized;  
        
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
