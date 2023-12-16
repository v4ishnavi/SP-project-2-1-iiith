function non_echo_signal = approach1_function(mixed_signal,fs)
[y, x] = xcorr(mixed_signal, 'coeff');
y = y(x>=0); 
x = x(x>=0);
figure(1);
stem(x/fs, y);

[pks, lcs] = findpeaks(y, x);
[peaks, locs] = findpeaks(pks, lcs);
echo_delay = locs(2) - locs(1); 
echo_amplitude = peaks(2) / peaks(1); 
echo_signal = [zeros(echo_delay, 1); ...
    mixed_signal(1:end-echo_delay)];
non_echo_signal = mixed_signal - ...
    echo_amplitude * echo_signal;
figure(2);
subplot(2,1,1)
plot(mixed_signal, 'r');
subplot(2,1,2)
 plot(non_echo_signal, 'g');

end
