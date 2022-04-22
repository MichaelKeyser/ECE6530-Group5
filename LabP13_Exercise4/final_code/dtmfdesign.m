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

    % preallocate space to store the bandpass filters
    hh = zeros(L, length(fb));

    % define constants outside of the for loop
    n = 0:L-1;
    w = (0:1/fs:pi);

    % create the badnapss filter for each frequency in fb
    for i = 1:length(fb)

        % create a bandpass filter
        % note: center freq wb = (fb / fs) * 2*pi;
        f = fb(i);
        h = cos((2*pi.*f.*n)/(fs)); 

        % compute magnitude response of bandpass filter
        H = freqz(h, 1, w);
        % compute scaling factor to get a maximum gain of 1
        beta = 1 / max(abs(H));

        % scale the filter and store it
        h = beta .* h;
        hh(:,i) = h;
    end
end