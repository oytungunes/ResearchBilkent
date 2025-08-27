clear all
close all
clc


datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
N = length(datFiles) ; 

 ii=1;

for i = 1:N
     thisFile = datFiles(i).name ; 
     if(thisFile(1)=='1')% 1 indicates walking and 6 indicates fall


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

% --- Data Matrix ---
% X: [N_samples_per_chirp x N_chirps]
[N_range, N_doppler] = size(X);


% --- 2D FFT for Range-Doppler Map ---
RDM = fft2(X);                            % Range + Doppler FFT
RDM = fftshift(RDM, 2);             % Center Doppler axis
RDM = RDM(1:N_range/2, :);    % Take positive range bins only
RDM_dB = 20*log10(abs(RDM)); % Convert to dB scale

% --- Axes Calculation ---
%range_axis = (c * Fs * (1:N_range/2-1)) / (2 * B * N_range);
%doppler_axis = linspace(-PRF/2, PRF/2, N_doppler);                 % Hz

% image resize as in the paper
range_doppler_resized = imresize(RDM_dB,[100,100],'bicubic');



figure
imagesc(range_doppler_resized)
 set(gca,'Fontsize',16)
xticklabels({'10','20','30','40','50'})
%set(gca,'YtickLabel',linspace(100,-100,10))


yticks([5 50 100 ])
yticklabels({'100','0','-100'})

 ylabel('Range (m)');
 xlabel('Doppler (Hz)')
 a=colorbar;
 ylabel(a,'Power (dB)','FontSize',16,'Rotation',270);
 saveas(gcf,'rangedopplerwalking','epsc')
% 
% 
% 
% range_doppler_walking(:,:,ii)=Rotated2;
% 
% range_doppler_walking_label(ii)=0;%0 for walking and 1 for fall
% %range_doppler_fall_label(ii)=1;%0 for walking and 1 for fall
% 
% 

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

% range_doppler_walking_label=range_doppler_walking_label';
% 
% %range_doppler_fall_label=range_doppler_fall_label';
% 
% % 
% save('range_doppler_walking_label.mat','range_doppler_walking_label');
% save('range_doppler_walking.mat','range_doppler_walking');
% 
% % save('range_doppler_fall_label.mat','range_doppler_fall_label');
% % save('range_doppler_fall.mat','range_doppler_fall');
