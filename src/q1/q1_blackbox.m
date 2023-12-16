clc, clearvars, close all
filename1 = 'C:\Users\shivk\Documents\Matlab\sp_project\input\';
filename2 = 'q1.wav';
filename = [filename1 filename2];
[total,fs] = play_plot_echo(filename);
