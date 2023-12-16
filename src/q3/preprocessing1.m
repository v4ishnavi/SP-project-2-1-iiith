clc, clearvars, close all

fan = 'music_ceiling-fan.wav';
traffic = 'music_city-traffic.wav';
cooker = 'music_pressure-cooker.wav';
pump = 'music_water-pump.wav'; 


[fs, fft_fan, fft_traffic, fft_cooker, fft_pump] = find_ffts(fan, traffic, cooker, pump); 

%plot_audio(fs,fft_fan, fft_traffic, fft_cooker, fft_pump);

fft_music = find_music(fft_fan, fft_traffic, fft_cooker, fft_pump); 

fan_audio = find_noise_audio(fft_fan, fft_music);
traffic_audio = find_noise_audio(fft_traffic, fft_music);
cooker_audio = find_noise_audio(fft_cooker, fft_music);
pump_audio = find_noise_audio(fft_pump, fft_music);

audiowrite('fan_audio.wav', fan_audio(30*fs:40*fs), fs);
disp("done")
audiowrite('traffic_audio.wav',traffic_audio(30*fs:40*fs), fs);
disp("done")
audiowrite('cooker_audio.wav', cooker_audio(30*fs:40*fs), fs);
disp("done")
audiowrite('pump_audio.wav', pump_audio(30*fs:40*fs), fs);
disp("done")