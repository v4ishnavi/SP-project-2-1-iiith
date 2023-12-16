clc, clearvars, close all
filename1 = 'C:\Users\shivk\Documents\Matlab\sp_project\input\';
filename2 = 'music_city-traffic.wav';
input = [filename1 filename2];
input_audio = loadmusicfile(input);
solve(input_audio);
