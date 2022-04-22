
fb = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
L = 200;
fs = 8000;

hh = dtmfdesign(fb, L, fs);

h1 = hh(:,7);


% how to synthesize a signal, taken from MATLAB documentation
f = 770;
Fs = 8000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = cos(2*pi*f*t);
% Y = fft(S);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% figure, plot(f,P1)


sc = dtmfscore(S, h1);


