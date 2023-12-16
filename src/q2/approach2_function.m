function combined_output = approach2_function(mixedSignal,fs)
notes = {'C4', 'D4', 'E4', 'F4', 'G4', 'A4', 'B4'};
frequencies = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88]; 
bandWidth = 20;
figure;
subplot(length(notes) + 2, 1, 1);
plot((0:length(mixedSignal)-1)/fs, mixedSignal);
title('Mixed Audio Signal');
combined_output = zeros(size(mixedSignal));
for i = 1:length(notes)
    filteredSignal = bandpass(mixedSignal, [frequencies(i) - bandWidth/2, frequencies(i) + bandWidth/2], fs);
    processed_signal = filter_it(filteredSignal, fs);
    combined_output = combined_output + processed_signal;
    subplot(length(notes) + 2, 1, i + 1);
    plot((0:length(processed_signal)-1)/fs, processed_signal);
    title(['Processed Signal for ' notes{i}]);
end
subplot(length(notes) + 2, 1, length(notes) + 2);
plot((0:length(combined_output)-1)/fs, combined_output);
title('Combined Output Signal');

figure;
plot((0:length(combined_output)-1)/fs, combined_output);
title('Combined Output Signal');
end
