function y = convert_numerical(tests)
hydro = 'IVLFCMAGTSWYPHDNEQKR';
iso = 'RKHPTIALGVWMSYQFNCED';

theta = linspace(0,2*pi,20);

for i=1:length(tests)
    thetai = theta(find(hydro==tests(i)));  
    phii = theta(find(iso==tests(i)));
    convsx(i) = sin(thetai)*cos(phii);
    convsy(i) = sin(thetai)*sin(phii);
    convsz(i) = cos(thetai);
end

y = abs(fft(convsx-mean(convsx))).^2 + abs(fft(convsy-mean(convsx))).^2 + abs(fft(convsz-mean(convsz))).^2;
y = y/max(y);
end