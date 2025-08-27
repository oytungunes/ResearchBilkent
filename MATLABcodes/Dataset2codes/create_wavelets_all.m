clear all
close all
clc


resizedim=100; % resize dimension
%% walking and fall

activityindex='1'; %1 indicates walking and 6 indicates fall
datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
[waveletdata1] = createsinglefilewavelet(datFiles,resizedim,activityindex);
disp('1')


datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/2 March 2017 Dataset/*.dat"); 
[waveletdata2] = createsinglefilewavelet(datFiles,resizedim,activityindex);
disp('2')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/3 June 2017 Dataset/*.dat");
[waveletdata3] = createsinglefilewavelet(datFiles,resizedim,activityindex);
disp('3')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/4 July 2018 Dataset/*.dat");
[waveletdata4] = createsinglefilewavelet(datFiles,resizedim,activityindex);
disp('4')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/5 February 2019 UoG Dataset/*.dat");
[waveletdata5] = createsinglefilewavelet(datFiles,resizedim,activityindex);
disp('5')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/6 February 2019 NG Homes Dataset/*.dat");
[waveletdata6] = createsinglefilewavelet(datFiles,resizedim,activityindex);
disp('6')

C = cat(3, waveletdata1, waveletdata2);
C = cat(3, C, waveletdata3);
C = cat(3, C, waveletdata4);
C = cat(3, C, waveletdata5);

wavelet_walking = cat(3, C, waveletdata6);
wavelet_walking_label=zeros(size(wavelet_walking,3),1);
save('wavelet_walking.mat','wavelet_walking');
save('wavelet_walking_label.mat','wavelet_walking_label' );
% 
% wavelet_fall = cat(3, C, waveletdata6);
% wavelet_fall_label=ones(size(wavelet_fall,3),1);
% save('wavelet_fall.mat','wavelet_fall');
% save('wavelet_fall_label.mat','wavelet_fall_label' );