clear all
close all
clc


resizedim=100; % resize dimension
%% walking and fall

activityindex='1'; %1 indicates walking and 6 indicates fall
datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/1 December 2017 Dataset/*.dat"); 
[rtdata1] = createsinglefilerangetime(datFiles,resizedim,activityindex);
disp('1')
%sum(sum(sum(isinf( rtdata1))))

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/2 March 2017 Dataset/*.dat"); 
[rtdata2] = createsinglefilerangetime(datFiles,resizedim,activityindex);
disp('2')

%sum(sum(sum(isinf( rtdata2))))


datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/3 June 2017 Dataset/*.dat");
[rtdata3] = createsinglefilerangetime(datFiles,resizedim,activityindex);
disp('3')

%sum(sum(sum(isinf( rtdata3))))


datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/4 July 2018 Dataset/*.dat");
[rtdata4] = createsinglefilerangetime(datFiles,resizedim,activityindex);
disp('4')

datFiles=dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/5 February 2019 UoG Dataset/*.dat");
[rtdata5] = createsinglefilerangetime(datFiles,resizedim,activityindex);
disp('5')

datFiles = dir("/Users/oytungunes/Desktop/RESEARCH2025/Dataset2/Dataset_848/6 February 2019 NG Homes Dataset/*.dat");
[rtdata6] = createsinglefilerangetime(datFiles,resizedim,activityindex);
disp('6')

C = cat(3, rtdata1, rtdata2);
C = cat(3, C, rtdata3);
C = cat(3, C, rtdata4);
C = cat(3, C, rtdata5);

rangetime_walking= cat(3, C, rtdata6);
save('rangetime_walking.mat','rangetime_walking');
rangetime_walking_label=zeros(size(rangetime_walking,3),1);
save('rangetime_walking_label.mat','rangetime_walking_label' );
% 
% rangetime_fall= cat(3, C, rtdata6);
% save('rangetime_fall.mat','rangetime_fall');
% rangetime_fall_label=ones(size(rangetime_fall,3),1);
% save('rangetime_fall_label.mat','rangetime_fall_label' );