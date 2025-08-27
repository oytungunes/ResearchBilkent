clear all
close all
clc


resizedim=100; % resize dimension
%% walking

activityindex='2'; %1 indicates walking, 2 for sit down and 6 indicates fall

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
[spectrogramdata1] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
disp('1')
datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/2 March 2017 Dataset/*.dat"); 
[spectrogramdata2] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
disp('2')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/3 June 2017 Dataset/*.dat");
[spectrogramdata3] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
disp('3')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/4 July 2018 Dataset/*.dat");
[spectrogramdata4] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
disp('4')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/5 February 2019 UoG Dataset/*.dat");
[spectrogramdata5] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
disp('5')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/6 February 2019 NG Homes Dataset/*.dat");
[spectrogramdata6] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
disp('6')

% son datada fall yok o yüzden ihmal edildi

% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/7 March 2019 West Cumbria Dataset/*.dat")
% [spectrogramdata7] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('7')

%%
C = cat(3, spectrogramdata1, spectrogramdata2);
C = cat(3, C, spectrogramdata3);
C = cat(3, C, spectrogramdata4);
C = cat(3, C, spectrogramdata5);

spectrogram_sit = cat(3, C, spectrogramdata6);
spectrogram_sit_label=2.*ones(size(spectrogram_sit,3),1);

save('spectrogram_sit.mat','spectrogram_sit');
save('spectrogram_sit_label.mat','spectrogram_sit_label');



%% fall
% 
% resizedim=100;
% activityindex='6'; %1 indicates walking and 6 indicates fall
% 
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
% [spectrogramdata1] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('1')
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/2 March 2017 Dataset/*.dat"); 
% [spectrogramdata2] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('2')
% 
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/3 June 2017 Dataset/*.dat");
% [spectrogramdata3] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('3')
% 
% datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/4 July 2018 Dataset/*.dat");
% [spectrogramdata4] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('4')
% 
% datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/5 February 2019 UoG Dataset/*.dat");
% [spectrogramdata5] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('5')
% 
% 
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/6 February 2019 NG Homes Dataset/*.dat");
% [spectrogramdata6] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% disp('6')
% 
% % son datada fall yok o yüzden ihmal edildi
% % datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/7 March 2019 West Cumbria Dataset/*.dat")
% % [spectrogramdata7] = createsinglefilespectrogram(datFiles,resizedim,activityindex);
% % disp('7')
% 
% % fall 100 x 100 x 
% C = cat(3, spectrogramdata1, spectrogramdata2);
% C = cat(3, C, spectrogramdata3);
% C = cat(3, C, spectrogramdata4);
% C = cat(3, C, spectrogramdata5);
% 
% spectrogram_fall = cat(3, C, spectrogramdata6);
% 
% save('spectrogram_fall.mat','spectrogram_fall');
% 
% spectrogram_walking_label=zeros(size(spectrogram_walking,3),1);
% spectrogram_fall_label=ones(size(spectrogram_fall,3),1);
% 
% save('spectrogram_walking_label.mat','spectrogram_walking_label' );
% save('spectrogram_fall_label.mat','spectrogram_fall_label');
