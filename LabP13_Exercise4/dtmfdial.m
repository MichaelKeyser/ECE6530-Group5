function xx = dtmfdial(keyNames,fs)
%DTMFDIAL  Create a signal vector of tones which will dial
%           a DTMF (Touch Tone) telephone system.
%
% usage:  xx = dtmfdial(keyNames,fs)
%  keyNames = vector of characters containing valid key names
%        fs = sampling frequency
%   xx = signal vector that is the concatenation of DTMF tones.
%
dtmf.keys = ...
 ['1','2', '3', 'A';
  '4', '5', '6', 'B';
  '7', '8', '9', 'C';
  '*','0','#','D'];
dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);

xx = [];


% A tone must be 0.2 seconds
% code inspried by Matlab documentation for fft
T = 1/fs;             % Sampling period       
L = 0.2 * fs; % Fs samples in 1 second * 0.2 = # samles in 0.2 s
t = (0:L-1)*T;        % Time vector
   
% Time for silence tones
L = 0.05 * fs; % Fs samples in 1 second * 0.2 = # samles in 0.2 s
silence = zeros(1,L);
    
for i = 1:length(keyNames)
    [ii,jj] = find(keyNames(i) == dtmf.keys);
    f1 = dtmf.colTones(ii,jj);
    f2 = dtmf.rowTones(ii, jj);
    
    tone = cos(2*pi*f1*t) + cos(2*pi*f2*t);
    xx = [xx, silence, tone];
end
end