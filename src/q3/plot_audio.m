function plot_audio(fs, Y1, Y2, Y3, Y4)
    f1 = (0:length(Y1)-1) * fs / length(Y1);

    figure;
    plot(f1, abs(Y1), 'LineWidth', 1.5);
    hold on;
    plot(f1, abs(Y2), 'LineWidth', 1.5);
    plot(f1, abs(Y3), 'LineWidth', 1.5); 
    plot(f1, abs(Y4), 'LineWidth', 1.5);

    xlabel('Frequency (Hz)');
    ylabel('Magnitude'); 

    legend('Signal {Y1}', 'Signal {Y1}', 'Signal {Y3}', 'Signal {Y4}');

    hold off;
end
