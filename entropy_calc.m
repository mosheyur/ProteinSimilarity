function [ en ] = entropy_calc( seq )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


f = double(seq);
sd = hist(f,length(uniquetol(f)));
p = sd./sum(sd);
p = p+eps;
en = 0 ; 
for i = 1:length(p) 
    
    
    en = en + p(i)*log2(p(i));

end

en = -en;