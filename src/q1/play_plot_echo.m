function [total,Fs] = play_plot_echo(filename)
[y,Fs] = audioread(filename);
col = size(y,2); % nymber of columns present in the file 

timelag = 5; %time between echo and original 
delta = round(Fs*timelag);  %converting it into audio scale 

orig = [y; zeros(3*delta, col)];
echo1 = [zeros(delta, col); y; zeros(2*delta,col)]*0.5;
echo2 = [zeros(2*delta, col); y; zeros(delta,col)]*0.5*0.5;
echo3 = [zeros(3*delta, col); y]*0.5*0.5*0.5;

total = orig + echo1 + echo2 + echo3;

t = (0:length(total)-1)/Fs;

for i= 1:col
figure(i);
subplot(2,1,1);
plot(t,orig(:,i));
hold on
plot(t,echo1(:,i));
plot(t,echo2(:,i));
plot(t,echo3(:,i));
hold off
legend(['Original: col ' num2str(i)], ...
           ['Echo1: col ' num2str(i)], ...
           ['Echo2: col ' num2str(i)], ...
           ['Echo3: col ' num2str(i)]);
 xlabel('Time (s)');
 ylabel('Amplitude');
 title(['Echoes and Audio Signal Separately for Channel ' num2str(i)]);

subplot(2,1,2);
plot(t,total(:,i));
xlabel("Time (s)");
ylabel("Amplitude");
title(['Total Audio: Channel '  num2str(i)]);
end
soundsc(total,Fs);
end