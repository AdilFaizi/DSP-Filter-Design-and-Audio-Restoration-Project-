% FIR Filter Example Requirements:
% Stopband edge 1: 500Hz, Passband edge 1: 1500 Hz, Passband edge 2: 2000 Hz, Stopband edge 2: 3000 Hz, Sampling frequency: 8000 Hz
% Pass-band ripple <= 0.01, Stopband ripple from 0 to 500Hz <= 0.01, Stopband ripple from 3000 to 4000Hz <= 0.001
% by Mohammad Adil Faizi

Stopband_edge_1 = 500; 
Passband_edge1 = 1500; 
Passband_edge_2 = 2000; 
Stopband_edge_2 = 3000; 
Sampling_frequency = 8000; 

Frequency = [Stopband_edge_1 Passband_edge1 Passband_edge_2 Stopband_edge_2]; 

Amplitude = [0 1 0]; % tells the FIR that the amplitude between 500 to 3000 is 1. 

Dev = [0.01 0.01 0.001]; 

[N, F, A, W] = firpmord(Frequency, Amplitude, Dev, Sampling_frequency); 

h = firpm(N, F, A, W); 

% The filter coefficients for the bandpass FIR Filter. 
fprintf("Filter Coefficients:\n"); 
disp(h); 

fprintf("Filter Length %d", N); 

freqz(h,1); 


