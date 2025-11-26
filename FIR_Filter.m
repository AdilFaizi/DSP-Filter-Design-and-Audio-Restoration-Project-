Stopband_edge_1 = 500; 

Passband_edge1 = 1500; 

Passband_edge_2 = 2000; 

Stopband_edge_2 = 3000; 

Sampling_frequency = 8000; 

Frequency = [Stopband_edge_1 Passband_edge1 Passband_edge_2 Stopband_edge_2]; 

Amplitude = [0 1 0]; % tells the FIR that the amplitude between 500 to 3000 is 1. 

Dev = [0.01 0.01 0.001]; 

[N, F, A, W] = firpmord(Frequency, Amplitude, Dev, Sampling_frequency); 

% The filter coefficients for the bandpass FIR Filter. 

fprintf("Filter Coefficients:\n"); 

disp(h); 

fprintf("Filter Length %d", N); 

h = firpm(N, F, A, W); 

freqz(h,1); 