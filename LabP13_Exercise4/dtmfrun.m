function keys = dtmfrun(xx, L, fs)
% returns the list of key names found in xx.
% keys = array of characters, i.e., the decoded key names
% xx = DTMF waveform
% L = filter length
% fs = sampling freq

center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633];

hh = dtmfdesign(center_freqs, L, fs);

[nstart, nstop] = dtmfcut(xx, fs);
keys = [];
for kk = 1:length(nstart)
    x_seg = xx(nstart(kk):nstop(kk));
    sc = dtmfscore(xx, hh);
    % fix this part to iterate through each filter and check it
    if sc == 1
        keys = [keys, sc];
    end
end

end