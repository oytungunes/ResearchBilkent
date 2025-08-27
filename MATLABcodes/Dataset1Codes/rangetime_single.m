

        clear all
        clc

        fs=1e7;
        resizedim=100;
        NTS=512;

         addpath '/Users/oytungunes/Desktop/RESEARCH2025/Dataset2'
         load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/FAST/1/adc_Data.mat']);

    
        adcDataRX1 = adc_DataTable.adc_DataRX1; 
        adcDataRX2 = adc_DataTable.adc_DataRX2; 
        adcDataRX3 = adc_DataTable.adc_DataRX3; 
        adcDataRX4 = adc_DataTable.adc_DataRX4; 

        adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;
   
        adcMatrix = reshape(adcData, NTS, []);
        RangeTimeMatrix = fft(adcMatrix,[],2);
        time=linspace(0,16,512);
        range=linspace(0,10,51200);

        figure
        imagesc(time,range,(10*log10(abs(RangeTimeMatrix))))
        set(gca,'FontSize',16)
        xlabel('Time (s)');
        ylabel('Range (m)');
        %title(' FAST Time-Frequency Plot via CWT');
         a=colorbar;
        ylabel(a,'Magnitude (dB)','FontSize',16,'Rotation',270);

         yticks([0 5 10])
         yticklabels({'10','5','0'})

        saveas(gcf,'rangetimefast','epsc')

%%

        load(['/Users/oytungunes/Desktop/RESEARCH2025/Dataset1/SLOW/2/adc_Data.mat']);

    
        adcDataRX1 = adc_DataTable.adc_DataRX1; 
        adcDataRX2 = adc_DataTable.adc_DataRX2; 
        adcDataRX3 = adc_DataTable.adc_DataRX3; 
        adcDataRX4 = adc_DataTable.adc_DataRX4; 

        adcData = adcDataRX1+adcDataRX2+adcDataRX3+adcDataRX4;

        adcMatrix = reshape(adcData, NTS, []);
        RangeTimeMatrix = fft(adcMatrix,[],2);
        time=linspace(0,16,512);
        range=linspace(0,10,51200);
 
        figure
        imagesc(time,range,(10*log10(abs(RangeTimeMatrix))))
        set(gca,'FontSize',16)
        xlabel('Time (s)');
        ylabel('Range (m)');
        %title(' FAST Time-Frequency Plot via CWT');
         a=colorbar;
        ylabel(a,'Magnitude (dB)','FontSize',16,'Rotation',270);

         yticks([0 5 10])
         yticklabels({'10','5','0'})

        saveas(gcf,'rangetimeslow','epsc')
