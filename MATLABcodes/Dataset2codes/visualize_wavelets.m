clear all
close all
clc
datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 


N = length(datFiles) ; 

for i = 1:N
    
     thisFile = datFiles(i).name ; 
     if(thisFile(1)=='6')% 1 indicates walking and 6 indicates fall
    
    
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
        t = 0:1/fs:numofchirpsforwavelet*Tsweep;         % Time vector
        [cfs, f] = cwt(IQData(1:numofchirpsforwavelet*NTS), 'morse', fs);   % 'morse' is the Morlet wavelet
        imagesc(abs(cfs(:,:,1)))
       
        set(gca,'FontSize',16)
        xticks ([2,100,200,300,400]);
        set(gca,'XtickLabel',[linspace(0,3,5)])

       
        yticks ([1,15,30,45,57]);
        set(gca,'YtickLabel',[linspace(55000,1100,5)])



        set(gca,'FontSize',16)
        xlabel('Time (ms)');
        ylabel('Frequency (Hz)');
       % title('Time-Frequency Plot via CWT');
        a=colorbar;
        ylabel(a,'Magnitude ','FontSize',16,'Rotation',270);

        saveas(gcf,'waveletfall','epsc')
        a=1;

     end

end