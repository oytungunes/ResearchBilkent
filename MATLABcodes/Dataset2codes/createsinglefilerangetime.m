function [rangetime_data] = createsinglefilerangetime(datFiles,resizedim,activityindex)

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
    
    
         adcMatrix = reshape(IQData, NTS, []);
        RangeMatrix = fft(adcMatrix,[],2);

        
        rangetime=10*log10(abs(RangeMatrix));  % Magnitude in dB
        rangetime_data(:,:,ii) = imresize(rangetime,[resizedim,resizedim],'bicubic');
        ii=ii+1;


     else

     end
     


end

end
  






