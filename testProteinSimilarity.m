close all
clear all
clc
tic

% fasta ='Chordate_Fasta_Merged.fasta'; 
%  fasta = 'ProteinSequences.fasta';
 fasta = 'hiv.fasta'
seqs = fastaread(fasta);
[header sequences] = fastaread(fasta);
m = 2; 
tau = 1;
n = length(sequences);

for i=1:n
    dft1{i} = convert_numerical(sequences{i});
%     [x y z] = convert_numerical2(sequences{i});
%     sig{i}{1} = x;  sig{i}{2} = y;  sig{i}{3} = z;
end

comb = nchoosek(1:n,2);
 for i=1:size(comb,1)
%      dx = dtw(sig{comb(i,1)}{1},sig{comb(i,2)}{1});
%      dy = dtw(sig{comb(i,1)}{2},sig{comb(i,2)}{2});
%      dz = dtw(sig{comb(i,1)}{3},sig{comb(i,2)}{3});
%      dr(i) = sqrt(dx^2+dy^2+dz^2);
     dist(i) = dtw(dft1{comb(i,1)},dft1{comb(i,2)});
%      dist2(i) = abs(log(ApEn(m,std(dft1{comb(i,1)})*.25,dft1{comb(i,1)},tau)/ApEn(m,std(dft1{comb(i,2)})*.25,dft1{comb(i,2)},tau)));
 end
%  dist = dist/sum(dist);
  phylotree = seqlinkage(dist,'single',seqs)
 view(phylotree)
 
%  phylotree2 = seqlinkage(dr,'single',seqs)
%  view(phylotree2)
 a = dist;
 b = triu(ones(n),1);
 b = b';
 b(~~b) = a;
b = b'