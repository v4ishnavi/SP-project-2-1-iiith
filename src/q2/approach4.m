% Initialize pivot to the right-most point
clc, clearvars, close all;
filename1 = 'C:\Users\shivk\Documents\Matlab\sp_project\input\';
filename2 = 'q2_easy.wav';
filename = [filename1 filename2];
[mixed_signal, fs] = audioread(filename);

approach4_function(mixed_signal,fs);