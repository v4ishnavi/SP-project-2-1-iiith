function [fs, Y1, Y2, Y3, Y4] = find_ffts(string1, string2, string3, string4)
[data1, fs] = audioread(string1);
[data2, ~] = audioread(string2);
[data3, ~] = audioread(string3);
[data4, ~] =audioread(string4);

Y1 = fft(data1);
Y2 = fft(data2);
Y3 = fft(data3);
Y4 = fft(data4);
