fb = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
L = 40;
fs = 8000;

hh = dtmfdesign(fb, L, fs);

w = (0:1/fs:pi);
f = (w / (2* pi)) * fs;
figure
hold on

for i = 1:length(fb)
    h = hh(:,i);
    H = abs(freqz(h, 1, w));
    plot(f, H); 
end
% f = (w / (2* pi)) * fs;
% figure, plot(f ,abs(H))