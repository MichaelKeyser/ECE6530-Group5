function  sc = dtmfscore(xx, hh)
% DTMFSCORE
%  usage:     sc = dtmfscore(xx, hh)
%  returns a score based on the max amplitude of the filtered output
% xx= input DTMF tone
% hh= impulse response of ONE bandpass filter

xx = xx * (2/max(abs(xx))); % scale to range [-2, 2]

y = conv(hh, xx); % filter xx

% If filtered amplitude >= 59%, the signal is detected
if max(abs(y)) >= 0.59
    sc = 1;
else
    sc = 0;
end
end