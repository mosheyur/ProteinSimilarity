close all
clear all
clc
tic
seqs = fastaread('ProteinSequences.fasta');
[header sequences] = fastaread('ProteinSequences.fasta');
m = 2; 
tau = 1;
n = length(sequences);

for i=1:n
    dft1{i} = convert_numerical(sequences{i});
    [x y z] = convert_numerical2(sequences{i});
    [code_hydro{i}, code_iso{i}]  = convert_numerical_bin(sequences{i});
    sig{i}{1} = x;  sig{i}{2} = y;  sig{i}{3} = z;
end

comb = nchoosek(1:n,2);
 for i=1:size(comb,1)
     dx = dtw(sig{comb(i,1)}{1},sig{comb(i,2)}{1});
     dy = dtw(sig{comb(i,1)}{2},sig{comb(i,2)}{2});
     dz = dtw(sig{comb(i,1)}{3},sig{comb(i,2)}{3});
     dr(i) = sqrt(dx^2+dy^2+dz^2);
     dist(i) = dtw(dft1{comb(i,1)},dft1{comb(i,2)});
%      dxk = conditional_complexity(sig{comb(i,1)}{1},sig{comb(i,2)}{1});
%      dyk = conditional_complexity(sig{comb(i,1)}{2},sig{comb(i,2)}{2});

%       dzk = conditional_complexity(sig{comb(i,1)}{3},sig{comb(i,2)}{3});

     dxk = mean([conditional_complexity(sig{comb(i,1)}{1},sig{comb(i,2)}{1}),conditional_complexity(sig{comb(i,2)}{1},sig{comb(i,1)}{1})]);
     dyk = mean([conditional_complexity(sig{comb(i,1)}{2},sig{comb(i,2)}{2}),conditional_complexity(sig{comb(i,2)}{2},sig{comb(i,1)}{2})]);
      dzk = mean([conditional_complexity(sig{comb(i,1)}{3},sig{comb(i,2)}{3}),conditional_complexity(sig{comb(i,2)}{3},sig{comb(i,1)}{3})]);
     dkk(i) = sqrt(dxk^2+dyk^2+dzk^2);
      dx_h(i) = hamm_mine(code_hydro{comb(i,1)},code_hydro{comb(i,2)});
      dy_h(i) = hamm_mine(code_iso{comb(i,1)},code_iso{comb(i,2)});
      dist_h(i) = dx_h(i)^2 + dy_h(i)^2;
      dist_raw(i) = mean([conditional_complexity(sequences{comb(i,1)},sequences{comb(i,2)}),conditional_complexity(sequences{comb(i,2)},sequences{comb(i,1)})]);
%      dist2(i) = abs(log(ApEn(m,std(dft1{comb(i,1)})*.25,dft1{comb(i,1)},tau)/ApEn(m,std(dft1{comb(i,2)})*.25,dft1{comb(i,2)},tau)));
 end
%  dist = dist/sum(dist);
  phylotree = seqlinkage(dist,'single',seqs)
 view(phylotree)
 phylotree2 = seqlinkage(dr,'single',seqs)
 view(phylotree2)
  phylotree3 = seqlinkage(dist_h,'single',seqs)
 view(phylotree3)
 phylotree4 = seqlinkage(dkk,'single',seqs);
 view(phylotree4)
   phylotree5 = seqlinkage(dist_raw,'single',seqs)
  view(phylotree5)
 a = dkk;
 b = triu(ones(n),1);
 b = b';
 b(~~b) = a;
b = b'