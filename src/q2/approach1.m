clc, clearvars, close all
filename1 = ['C:\Users\shivk\Documents\' ...
    'Matlab\sp_project\input\'];
filename2 = 'q2_easy.wav';
filename = [filename1 filename2];
[mixed_signal, fs] = audioread(filename);

non_echo_signal = approach1_function(mixed_signal,fs);

soundsc(non_echo_signal,fs);
