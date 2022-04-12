

function  hh = dtmfdesign(fb, L, fs)
%DTMFDESIGN
%  hh = dtmfdesign(fb, L, fs)
%    returns a matrix (L by length(fb)) where each column contains
%    the impulse response of a BPF, one for each frequency in fb
%    fb = vector of center frequencies
%    L = length of FIR bandpass filters
%    fs = sampling freq
% Each BPF must be scaled so that its frequency response has a
%  maximum magnitude equal to one.

beta = 1;
n = 0:L-1;
h = beta * cos((2*pi.*fb.*n)/(fs)); % figure this out

wb = fb * 2*pi;

w = (wb-pi:(1/fs):wb+pi);


H = freqz(h, 1, w);

% fac = max(abs(H));
% beta = 1 / fac;
% 
% h = beta * cos((2*pi.*fb.*n)./fs);
% H = freqz(h, 1, w);

%H = DTFT(h, w);


figure, plot(w/(2*pi),abs(H))

hh = H;
end

% Compute the DTFT of a given sequence
function X = DTFT(x, w)
    X = 0;
    N = length(x);
    % compute the DTFT
    for n = 0:N-1
        n_ind = n + 1;
        X = x(n_ind) * exp(-1j.*w *n) + X;
    end
end