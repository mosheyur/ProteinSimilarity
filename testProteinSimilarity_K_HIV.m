close all
clear all
clc
tic
seqs = fastaread('hiv.fasta');
[header sequences] = fastaread('hiv.fasta');
n = length(sequences);
comb = nchoosek(1:n,2);
 for i=1:size(comb,1)
      dist(i) =conditional_complexity(sequences{comb(i,1)},sequences{comb(i,2)});
 end
phylotree =  seqneighjoin(dist,'equivar',header,'Reroot','false');
% phylotree = seqlinkage(dist,'single',seqs);
view(phylotree)
a = dist;
b = triu(ones(n),1);
b = b';
b(~~b) = a;
b = b';