function  sc = dtmfscore(xx, hh)
% DTMFSCORE
%  usage:     sc = dtmfscore(xx, hh)
%  returns a score based on the max amplitude of the filtered output
% xx= input DTMF tone
% hh= impulse response of ONE bandpass filter

% scale to range [-2, 2]
xx = xx * (2/max(abs(xx))); 

% Apply the bandpass filter to the input tone
y = conv(hh, xx); 

% If filtered amplitude >= 59% of original, the signal is detected
sc = double(max(abs(y)) >= 0.59);
end