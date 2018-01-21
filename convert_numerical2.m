function [x ,y, z] = convert_numerical2(tests)


hydro = 'IVLFCMAGTSWYPHDNEQKR';
iso = 'RKHPTIALGVWMSYQFNCED';
pk = 'TWILAGVMSYEKRQNPCDFH';
dummy = 'FCMAGTDNEQKRIVLSWYPH';
seq1 = hydro;
seq2 = pk;
theta = linspace(0,2*pi,20);

for i=1:length(tests)
    thetai = theta(find(seq1==tests(i)));  
    phii = theta(find(seq2==tests(i)));
    convsx(i) = sin(thetai)*cos(thetai);
    convsy(i) = sin(thetai)*sin(phii);
    convsz(i) = cos(thetai);
end
x = convsx;
y = convsy;
z = convsz;
% y = abs(fft(convsx-mean(convsx))).^2 + abs(fft(convsy-mean(convsx))).^2 + abs(fft(convsz-mean(convsz))).^2;
% y = y/max(y);
end