function approach4_function(mixed_signal,fs)
q = -0.0001;
[y, x] = xcorr(mixed_signal, 'coeff');
y = abs(y(x >= 0));
x = x(x >= 0);
x_n = x / max(x);

figure(1);
stem(x_n, y);
hold on
plot(x_n, y(1) + q * x_n, 'LineWidth', 1.5)
hold off
legend("Autocorrelation", "Line");
title('Autocorrelation of the Signal');
xlabel('Normalized Lag');
ylabel('Autocorrelation Coefficient');

significant_points = [];
pivot = max(y);
pivot_index = length(x);
significant = zeros(1, length(y));
significant(1) = y(1);
j = 0;
while j <= length(x)-1
    for i = length(x):-1:pivot_index
        cute = 0; 
        y_line(i) = pivot + q * (x_n(i));  % Notice the change here
        if y_line(i) < 0
            break;
        end

        if y(i) >= y_line(i)
            if i > 1 && y(i) >= y(i-1) && y(i) >= y(i+1)
                disp("in2")
                significant(i) = y(i);
                pivot = y(i);  % Update pivot to the new significant peak
                pivot_index = i;
                cute = 1;
                break; 
            end
        end
    end
    
    j = j + 1;

    if cute == 0
        q = q*1.01;
    end
    if y_line(1) < y(1)
        break
    end
    if pivot <= 0 || pivot_index <= 1
        break;
    end
end

figure(2);
plot(x, y, 'b');
hold on;
plot(x(significant > 0), significant(significant > 0), 'r*');
hold off;
title('Significant Points in Autocorrelation');
xlabel('Lag');
ylabel('Autocorrelation Coefficient');
legend('Autocorrelation', 'Significant Points');
end