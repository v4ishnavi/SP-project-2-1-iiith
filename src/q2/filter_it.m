function non_echo_signal = filter_it(mixed_signal, fs)
    [y, x] = xcorr(mixed_signal, 'coeff');
    y = y(x>=0); 
    x = x(x>=0);
    
    [pks, lcs] = findpeaks(y, x);
    [peaks, locs] = findpeaks(pks, lcs);
    
    if length(locs) < 2
        disp('Not enough peaks for echo detection. Returning original signal.');
        non_echo_signal = mixed_signal;
        return;
    end
    
    echo_delay = locs(2) - locs(1);
    echo_amplitude = peaks(2) / peaks(1);
    echo_signal = [zeros(echo_delay, 1); mixed_signal(1:end-echo_delay)];
    non_echo_signal = mixed_signal - echo_amplitude * echo_signal;
    threshold = 0.*max(non_echo_signal);
    for i = 1:length(non_echo_signal)
        if(non_echo_signal(i)<threshold)
            non_echo_signal(i) = 0;
        end
    end
end
