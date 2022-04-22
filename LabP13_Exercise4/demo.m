fs = 8000;  %<--use this sampling rate in all functions
tk = ['A', 'B', 'C', 'D' ,'*','#', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
xx = dtmfdial( tk, fs );
soundsc(xx, fs)
L = 200;
dtmfrun(xx, L, fs)