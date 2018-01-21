clear all
close all
clc
seqs = fastaread('influenza_odd.fasta');
[header sequences] = fastaread('influenza_odd.fasta');
% 

% 
%       [header_1 sequences_1] = fastaread('Bacteria.fasta');
% 
%         seqs_1 = struct('Header',{'Bacteria'},'Sequence',{sequences_1});
% % 
% 
%   fastawrite('influenza_odd.fasta',seqs_1 )