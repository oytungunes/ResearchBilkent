clear all
close all
clc


resizedim=100; % resize dimension

%% sit down

activityindex='2'; %1 indicates walking, 2 indicates sitdown and 6 indicates fall

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
[rangedopplerdata1] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
disp('1')
datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/2 March 2017 Dataset/*.dat"); 
[rangedopplerdata2] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
disp('2')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/3 June 2017 Dataset/*.dat");
[rangedopplerdata3] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
disp('3')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/4 July 2018 Dataset/*.dat");
[rangedopplerdata4] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
disp('4')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/5 February 2019 UoG Dataset/*.dat");
[rangedopplerdata5] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
disp('5')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/6 February 2019 NG Homes Dataset/*.dat");
[rangedopplerdata6] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
disp('6')



% walking 100 x 100 x 
C = cat(3, rangedopplerdata1, rangedopplerdata2);
C = cat(3, C, rangedopplerdata3);
C = cat(3, C, rangedopplerdata4);
C = cat(3, C, rangedopplerdata5);

range_doppler_sit = cat(3, C, rangedopplerdata6);

save('range_doppler_sit.mat','range_doppler_sit');

range_doppler_sit_label=2.*ones(size(range_doppler_sit,3),1);
save('range_doppler_sit_label.mat','range_doppler_sit_label');


%% fall
% 
% activityindex='6'; %1 indicates walking and 6 indicates fall
% 
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
% [rangedopplerdata1] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
% disp('1')
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/2 March 2017 Dataset/*.dat"); 
% [rangedopplerdata2] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
% disp('2')
% 
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/3 June 2017 Dataset/*.dat");
% [rangedopplerdata3] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
% disp('3')
% 
% datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/4 July 2018 Dataset/*.dat");
% [rangedopplerdata4] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
% disp('4')
% 
% datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/5 February 2019 UoG Dataset/*.dat");
% [rangedopplerdata5] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
% disp('5')
% 
% datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/6 February 2019 NG Homes Dataset/*.dat")
% [rangedopplerdata6] = createsinglefilerangedoppler(datFiles,resizedim,activityindex);
% disp('6')
% 
% 
% C = cat(3, rangedopplerdata1, rangedopplerdata2);
% C = cat(3, C, rangedopplerdata3);
% C = cat(3, C, rangedopplerdata4);
% C = cat(3, C, rangedopplerdata5);
% 
% range_doppler_fall = cat(3, C, rangedopplerdata6);
% 
% save('range_doppler_fall.mat','range_doppler_fall');
% 
% 
% range_doppler_walking_label=zeros(size(range_doppler_walking,3),1);
% range_doppler_fall_label=ones(size(range_doppler_fall,3),1);
% 
% save('range_doppler_walking_label.mat', 'range_doppler_walking_label');
% save('range_doppler_fall_label.mat','range_doppler_fall_label');
