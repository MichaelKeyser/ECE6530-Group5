function keys = dtmfrun(xx, L, fs)
% returns the list of key names found in xx.
% keys = array of characters, i.e., the decoded key names
% xx = DTMF waveform
% L = filter length
% fs = sampling freq

% define the center frequencies of each key and the possible keys
center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
dtmf.keys = ...
 ['1','2', '3', 'A';
  '4', '5', '6', 'B';
  '7', '8', '9', 'C';
  '*','0','#','D'];

% create a set of bandpass filters, one for each center frequency
hh = dtmfdesign(center_freqs, L, fs);

% find the start and stop of each dial tone in the input sequence
[nstart, nstop] = dtmfcut(xx, fs);

% identify the key in each dial tone
keys = [];
for kk = 1:length(nstart)
    % select a tone
    x_seg = xx(nstart(kk):nstop(kk));
    
    % allocate an array to store which bandpass filters the tone "passed"
    match = zeros(size(hh,2),1);
    for i = 1:size(hh,2)
        % remember which bandpass filters are "passed"
        if dtmfscore(x_seg, hh(:,i))
            match(i) = i;
        end
    end
    
    % if exactly 2 filters are "passed", then it is a dial tone
    if nnz(match) == 2
        ind = find(match);
        
        % convert filter number into indices to use for dtmf struct
        ind1 = ind(1);
        ind2 = ind(2) - 4;
        
        % select the key
        key = dtmf.keys(ind1, ind2);
        keys = [keys, key];
    end 
end
end