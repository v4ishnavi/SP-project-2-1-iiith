function noise_only = find_noise_audio(fft_nm, fft_m)
%here fft_nm is fft of noise and music , and fft_m is fft of only music 
n = length(fft_nm);
noise_only_freq = zeros(1, n);
for i = 1:n
    noise_only_freq(i) = fft_nm(i) - fft_m(i);
end
noise_only = ifft(noise_only_freq);