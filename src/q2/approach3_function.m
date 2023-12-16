function approach3_function(mixed_signal,fs)
q = 0.002;
[y, x] = xcorr(mixed_signal, 'coeff');
y = abs(y(x >= 0));
x = x(x >= 0);
x_n = x / max(x);

figure(1);
stem(x_n, y);
hold on
plot(x_n, y(1) + q * y, 'LineWidth', 1.5)
hold on
plot(x_n, mixed_signal)
hold off
legend("Autocorrelation", "Line");
title('Autocorrelation of the Signal');
xlabel('Normalized Lag');
ylabel('Autocorrelation Coefficient');

significant_points = [];
pivot = max(y);
significant = zeros(1, length(y));
significant(1) = max(y);
pivot_index = 1;
y_line = zeros(1, length(y));
j = 1;

while j <= length(x)-1
    for i = pivot_index+1:length(x)
        cute = 0; 
        y_line(i) = pivot - q * pivot; 
        if y_line(i) < 0
            break;
        end

        if y(i) >= y_line(i)
            if y(i) >= y(i-1) && y(i)>=y(i+1)
                disp([y(i-1), y(i), y(i+1)]);
                significant(i) = y(i);
                pivot = y(i);
                pivot_index = i;
                cute = 1;
                break; 
            end
        end
    end
    
    j = j + 1;

    if cute==0
        q = q*1.5;
    end
    if y_line(length(x)) < y(length(x))
        break
    end
    if pivot <= 0 || pivot_index >= length(x) 
        break;
    end
end
% Find local maxima in significant values
[localMaxValues, localMaxIndices] = findpeaks(significant, "MinPeakDistance", 0.5*fs);

% Update the plot to show the local maxima
figure(3);
plot(x, y, 'b');
hold on;
plot(x(localMaxIndices), localMaxValues, 'mo'); % 'mo' denotes magenta circles
hold off;
title('Local Maxima in Significant Autocorrelation Points');
xlabel('Lag');
ylabel('Autocorrelation Coefficient');
legend('Autocorrelation', 'Local Maxima');
end