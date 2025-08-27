clear all
close all
clc
datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 


N = length(datFiles) ; 

for i = 20:N
    
     thisFile = datFiles(i).name ; 
     if(thisFile(1)=='2')% 1 indicates walking 2 indicates sit and 6 indicates fall
    
    
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
        
        % fs =s 1000;
        % t = 0:1/fs:2-1/fs;
        % y = chirp(t,100,1,200,'quadratic');
        % %Estimate the spectrum of the chirp using the short-time Fourier transform implemented in the spectrogram function.
        % % Divide the signal into sections of length 100, windowed with a Hamming window. 
        % % Specify 80 samples of overlap between adjoining sections and evaluate the spectrum at ⌊100/2+1⌋=51 frequencies.
        % 
        % spectrogram(y,100,80,100,fs,'yaxis')
        

        [spect,f,t,p] = spectrogram(RangeMatrix(1, :), (NTS), 64, NTS,fs,'centered','yaxis');
        
        for  a = 2 : NTS
        
            [s,f,t,p] = spectrogram(RangeMatrix(a, :), (NTS), 64, NTS,fs,'centered','yaxis'); 
            spect = spect + s;
        
        end
        
        spect2= helperPreprocess(spect);
        doppler = linspace(-100,100,size(spect2,1));    
        time=linspace(0,20,size(spect2,2));
        T=time;
        F=doppler;
        colorbar
        imagesc(time,doppler,spect2);
        set(gca,'Fontsize',16)
        xlabel('Time(s)');
        ylabel('Doppler(Hz)')
        set(gca,'YtickLabel',[100:-50:-100])
        a=colorbar;
        ylabel(a,'Power (dB)','FontSize',16,'Rotation',270);

        saveas(gcf,'Spectrogramsit','epsc')
        a=1;


        
    
     else

     end

 end

