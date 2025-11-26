# DSP-Filter-Design-and-Audio-Restoration-Project-
This project implements a complete digital signal processing workflow for FIR filter design and audio noise removal. Using MATLAB, a bandpass FIR filter is designed based on strict passband/stopband ripple specifications, followed by multi-method restoration of a noisy music signal.

----My Process: 

Bandpass FIR Filter Design 
Designed a bandpass FIR filter using windowing and/or Parks–McClellan methods. Calculated filter length, derived coefficients, and generated magnitude/phase responses to meet precise ripple and attenuation requirements.

Noise Identification in Audio Signals
Analyzed the noisy .wav file using spectrograms, FFT analysis, and power spectral density to isolate and characterize dominant noise components.

Two Noise-Removal Approaches

Time-Domain Filtering: Applied FIR filtering and smoothing techniques.

Frequency-Domain Suppression: Used STFT-based masks, spectral subtraction, and band elimination.

Performance Verification
Measured passband/stopband ripple, attenuation, and reconstruction quality. Conducted listening tests and visualized the cleaned audio through spectrogram comparison.


![alt text](FIR-Filter-Example.png)
