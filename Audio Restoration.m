% Audio Restoration Section 
% by Adil Faizi, 220290664
% By using frequency domain plot analysis, we can determine that two specific frequencies stand out in this sound signal. Then utilizing a notch filter to reduce their magnitudes

%%--------------------------------------------------------------
%Frequency Domain Equivalent
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

%%-------------------------------------------------------------
%Time Domain Equivalent
[X, fs] = audioread("music_noisy.wav");

% Using time domain to plot the sound
t = (0:length(X)-1) / fs; % Create a time vector based on the sampling frequency
plot(t, X); % Plot the audio signal in the time domain
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal in Time Domain');


%midpoint frequency 
f_center = 1102.49;   
bw = 12; %this is our bandwith so i want it have a range of an upper and lower freq.
f_lower = f_center - bw;   
f_upper = f_center + bw;
F = [0 f_lower f_upper fs/2]; 
A = [1 0 1];                   
Dev = [0.01  0.01 0.01 ];  
[N, Fi, Ai, W] = firpmord(F, A, Dev, fs);  
b = firpm(N, Fi, Ai, W);    
figure;
freqz(b, 1);
title('1102.49 Hz FIR Filter');

%same process as 1102.49 frequency.
f_center2 = 2756.27;  
bw2 = 12;             
f_lower2 = f_center2 - bw2;  
f_upper2 = f_center2 + bw2;  
F2 = [0 f_lower2 f_upper2 fs/2];  
A2 = [1 0 1];                      
Dev2 = [0.01  0.01 0.01 ];    
[N2, Fi2, Ai2, W2] = firpmord(F2, A2, Dev2, fs);  
b2 = firpm(N2, Fi2, Ai2, W2);                    
figure;
freqz(b2, 1);
title('2756.27 Hz FIR Filter');


filtered_1 = filter(b, 1, X); %yq
filtered_2 = filter(b2, 1, filtered_1);

sound(Y2, fs);


