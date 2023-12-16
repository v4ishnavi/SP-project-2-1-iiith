clc; clearvars; close all;
filename1 = 'C:\Users\shivk\Documents\Matlab\sp_project\input\';
filename2 = 'q2_not_so_easy.wav';
string1 = [filename1 filename2];
[mixedSignal, fs] = audioread(string1);
combined_output = approach2_function(mixedSignal,fs);
soundsc(mixedSignal,fs);