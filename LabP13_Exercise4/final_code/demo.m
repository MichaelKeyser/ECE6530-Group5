% clear workspace
clear

% define sampling frequency, filter length, and possible keys
fs = 8000; 
L = 200;
possible_keys = ['A', 'B', 'C', 'D' ,'*','#', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

% generate a random sequence of keys
ind = randi([1 16], 1, 1000);
rand_keys = possible_keys(ind);

% create a dial tone using the keys
xx = dtmfdial(rand_keys, fs);

% identify the keys in the input sequence
keys = dtmfrun(xx, L, fs);

% compare the detected tones to the input to ensure they match
strcmp(rand_keys, keys)
    