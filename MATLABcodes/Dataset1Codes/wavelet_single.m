

        clear all
        clc
        close all


        fs=1e7;
        resizedim=100;

         addpath '/Users/oytungunes/Desktop/RESEARCH2025/Dataset2'
         load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/3/adc_Data.mat']);

    
        adcDataRX1 = adc_DataTable.adc_DataRX1; 
        adcDataRX2 = adc_DataTable.adc_DataRX2; 
        adcDataRX3 = adc_DataTable.adc_DataRX3; 
        adcDataRX4 = adc_DataTable.adc_DataRX4; 

        adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
        Tsweep=66e-6;
        NTS=512;
        numofchirpsforwavelet=3;
        t = 0:1/fs:numofchirpsforwavelet*Tsweep;         % Time vector
        [cfs, f] = cwt(adcData(1:numofchirpsforwavelet*NTS), 'morse', fs);   % 'morse' is the Morlet wavelet
               %subplot(1,2,1)

               %%
        time=linspace(0,16,size(cfs,2));
        imagesc((abs(cfs(:,:,1))))
        xlabel('Time (us)');
        ylabel('Frequency (MHz)')
        
         a=colorbar;
      
         set(gca,'Fontsize',16)
         
         xticks([linspace(2,1500,4)])
         set(gca,'XtickLabel',[0:50:150])

        yticks([ 1 10 20 30 40 50 60 70 77])
         set(gca,'YtickLabel',[    4.3000    3.7000    3.2000    2.6000    2.1000    1.6000    1.0000    0.5000    0.0220])

        ylabel(a,'Magnitude','FontSize',16,'Rotation',270);

        %%

        saveas(gcf,'waveletfast','epsc')



        load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/3/adc_Data.mat']);

    
        adcDataRX1 = adc_DataTable.adc_DataRX1; 
        adcDataRX2 = adc_DataTable.adc_DataRX2; 
        adcDataRX3 = adc_DataTable.adc_DataRX3; 
        adcDataRX4 = adc_DataTable.adc_DataRX4; 

        adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
   
        t = 0:1/fs:numofchirpsforwavelet*Tsweep;         % Time vector
        [cfs, f] = cwt(adcData(1:numofchirpsforwavelet*NTS), 'morse', fs);   % 'morse' is the Morlet wavelet
       % subplot(1,2,2)
        figure
        imagesc(abs(cfs(:,:,1)))
        xlabel('Time(us)');
        ylabel('Frequency(MHz)')
        
        a=colorbar;
      
         set(gca,'Fontsize',16)

    xticks([linspace(2,1500,4)])
         set(gca,'XtickLabel',[0:50:150])

        yticks([ 1 10 20 30 40 50 60 70 77])
         set(gca,'YtickLabel',[    4.3000    3.7000    3.2000    2.6000    2.1000    1.6000    1.0000    0.5000    0.0220])

         ylabel(a,'Magnitude','FontSize',16,'Rotation',270);

        saveas(gcf,'waveletslow','epsc')
