close all
clear all
clc
tic
seqs = fastaread('ProteinSequences_odd.fasta');
[header sequences] = fastaread('ProteinSequences_odd.fasta');
m = 2; 
tau = 1;
n = length(sequences);

% for i=1:n
%     dft1{i} = convert_numerical(sequences{i});
%     [x y z] = convert_numerical2(sequences{i});
%     sig{i}{1} = x;  sig{i}{2} = y;  sig{i}{3} = z;
% end

comb = nchoosek(1:n,2);
 for i=1:size(comb,1)
     d1(i) = conditional_complexity(sequences{comb(i,1)},sequences{comb(i,2)});


 end
 
toc
 phylotree3 = seqlinkage(d1,'single',header);
% phylotree3 = seqneighjoin(dkk,'equivar',header,'Reroot','false');
 view(phylotree3)
 a = d1;
 b = triu(ones(n),1);
 b = b';
 b(~~b) = a;
b = b';
b = b + triu(b,-1)';

M = b;
pos = mdscale(M,2);
colors=['r','b','k','c','y','m','g'];
for i=1:length(pos)
    plot(pos(i, 1), pos(i, 2),'o');
    text(pos(i,1)+.0009,pos(i,2)+.0009,header{i},'fontSize',10);
    hold on;

end