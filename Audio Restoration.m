% Audio Restoration Section
% by Adil Faizi

[X, fs] = audioread("music_noisy.wav");

% FFT of original
Y = fft(X);
f = (0:length(Y)-1) * (fs / length(Y));
figure;
plot(f, abs(Y));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT of Noisy Music');
xlim([0 fs/2]);


%Utilizing the FFT to detect any unnatural magnitudes, and then applying the notch filter on these specific places.
frequenciesToNotch = [1102.49, 2756.27];
filtered_X = X;
for k = 1:length(frequenciesToNotch)
    notch = dsp.NotchPeakFilter("CenterFrequency", frequenciesToNotch(k), "SampleRate", fs);
    filtered_X = notch(filtered_X);
end

% FFT plot
Y_filtered = fft(filtered_X);
f_filtered = (0:length(Y_filtered)-1)*(fs/length(Y_filtered));

figure;
plot(f_filtered, abs(Y_filtered));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT of Filtered Music');
xlim([0 fs/2]);

%play filtered sound
sound(filtered_X, fs);
%write sound file
audiowrite("filtered_noisysound.wav", filtered_X, fs);

