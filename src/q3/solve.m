function solve(input_audio)
s1 = 'cooker_audio.wav';
s2 = 'fan_audio.wav';
s3 = 'pump_audio.wav';
s4 = 'traffic_audio.wav';
[s_1, fs] = audioread(s1);
[s_2, ~] = audioread(s2);
[s_3, ~] = audioread(s3);
[s_4, ~] = audioread(s4);

soundsc(input_audio,fs);
corr1 = xcorr(s_1, input_audio);
corr2 = xcorr(s_2, input_audio);
corr3 = xcorr(s_3, input_audio);
corr4 = xcorr(s_4, input_audio);

threshold = 0.25*max([(corr1 + corr2 + corr3 + corr4)/4]); 

% count_corr1 = sum(abs(corr1) > threshold);
% count_corr2 = sum(abs(corr2) > threshold);
% count_corr3 = sum(abs(corr3) > threshold);
% count_corr4 = sum(abs(corr4) > threshold);

count_corr1 = max(abs(corr1));
count_corr2 = max(abs(corr2));
count_corr3 = max(abs(corr3));
count_corr4 = max(abs(corr4));

count_correlations = [count_corr1, count_corr2, count_corr3, count_corr4];

[~, max_index] = max(count_correlations);

if max_index == 1
    disp("The noise is of a cooker");
    soundsc(s_1, fs);
elseif max_index == 2
    disp("The noise is of a fan");
    soundsc(s_2, fs);
elseif max_index == 3
    disp("The noise is of a pump");
    soundsc(s_3, fs);
else
    disp("The noise is of traffic");
    soundsc(s_4, fs);
end
end