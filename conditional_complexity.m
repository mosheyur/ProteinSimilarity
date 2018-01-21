function d = conditional_complexity(x,y)
    save('x.txt','x','-ascii');
    save('y.txt','y','-ascii');
    zip('x.zip','x.txt');
    zip('y.zip','y.txt');
    xy = [x y];
    save('xy.txt','xy','-ascii');
    zip('xy.zip','xy.txt');
    
     xf = dir('x.zip');  yf = dir('y.zip');  xyf = dir('xy.zip');
     
%     d = xyf.bytes/(xf.bytes + yf.bytes);
    d = (xyf.bytes-min([xf.bytes yf.bytes]))/max([xf.bytes yf.bytes]);
end