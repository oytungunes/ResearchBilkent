clear all
close all
clc

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 

resizedim=100;

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
        
        adcMatrix = reshape(IQData, NTS, []);
        RangeMatrix = fft(adcMatrix,[],2);

        
        rangetime=10*log10(abs(RangeMatrix));  % Magnitude in dB
        rangetime_resized= imresize(rangetime,[resizedim,resizedim],'bicubic');
        imagesc(rangetime_resized)
        set(gca,'FontSize',16)
        yticks([2  50 100])
        yticklabels({'10','5','0'})
         ylabel('Range (m)');
         xlabel('Time (s)')
         a=colorbar;
         ylabel(a,'Power (dB)','FontSize',16,'Rotation',270);
         saveas(gcf,'rangetimefall','epsc');
         a=1;


     else

     end


end

