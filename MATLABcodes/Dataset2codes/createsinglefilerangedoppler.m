function [rangedopplerdata] = createsinglefilerangedoppler(datFiles,resizedim,activityindex)

N = length(datFiles) ; 

 ii=1;

for i = 1:N
     thisFile = datFiles(i).name ; 
     if(thisFile(1)==activityindex)% 1 indicates walking and 6 indicates fall


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
    
    
    X=reshape(IQData, [length(IQData)/nc , nc]);

     % --- Radar Parameters ---
    c = 3e8;               % Speed of light (m/s)
    B = radarData(4);             % FMCW bandwidth (Hz)
    Fs = fs;              % Sampling frequency (Hz)
    T_chirp =Tsweep;       % Chirp duration (s)
    fc = fc;             % Radar center frequency (Hz)
    PRF = 1 / T_chirp;     % Pulse Repetition Frequency (Hz)

     RDM = fft2(X);                            % Range + Doppler FFT
    RDM_dB = 20*log10(abs(fftshift(RDM))); % Convert to dB scale



% image resize as in the paper
range_doppler_resized = imresize(RDM_dB,[resizedim,resizedim],'bicubic');



    %imagesc(Rotated2)

    rangedopplerdata(:,:,ii)=range_doppler_resized;

    %range_doppler_walking_label(ii)=0;%0 for walking and 1 for fall
    %range_doppler_fall_label(ii)=1;%0 for walking and 1 for fall



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

end

