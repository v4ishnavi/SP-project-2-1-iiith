clc, clearvars, close all;
filename1 = 'C:\Users\shivk\Documents\Matlab\sp_project\input\';
filename2 = 'q2_not_so_easy.wav';
filename = [filename1 filename2];
[mixed_signal, fs] = audioread(filename);

approach3_function(mixed_signal,fs);

