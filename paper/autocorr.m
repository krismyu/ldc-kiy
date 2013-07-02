N=180; % Number of samples
f1=200; % Frequency of the sinewave
FS=800; % Sampling Frequency
n=0:N-1; % Sample index numbers
x=cos(2*pi*f1*n/FS); % Generate the signal, x(n)
t=[1:N]*(1/FS); % Prepare a time axis 
subplot(2,1,1); % Prepare the figure
plot(t,x); % Plot x(n)
title('Sinwave of frequency 400Hz [FS=8000Hz]');
xlabel('Time, [s]');
ylabel('Amplitude');
grid;
Rxx=xcorr(x); % Estimate its autocorrelation
subplot(2,1,2); % Prepare the figure
n_index=[-179:1:179];
plot(n_index,Rxx); % Plot the autocorrelation
grid;
title('Autocorrelation function of the sinewave');
xlabel('lags');
ylabel('Autocorrelation');

0.5*sin(4*pi*f1*n/FS) + 