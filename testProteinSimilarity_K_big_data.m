close all
clear all
clc
tic

%read the fasta from the directories 
cur = pwd;
loc = 'E:\Docs\Buet_Masters\April 2017\Information & Coding Theory\Project\ProteinSimilarity\Chordate_fasta_database\';
cd(loc)
listing = dir('*.fasta*');
cd(cur)
 

for i = 1:length(listing) 
    % seqs(i) = fastaread(strcat(loc,listing(i).name));
    [header sequences] = fastaread(strcat(loc,listing(i).name));
    seqs_for_write(i) = struct('Header',header,'Sequence',{sequences});
    d = split(listing(i).name,'.');
    species_data(i,1) = d(1);
    c =  split(header,' ');  
    species_data(i,2) = c(1);
    seqs(i) = struct('Header',{char(d(1))},'Sequence',{sequences});
    header_mine(i) = d(1);
end

% Write the merged fasta 

filename = 'Mamal_Fasta_Merged.fasta';

if exist(filename,'file')  
   delete(filename)
end

fastawrite(filename,seqs);

n = length(seqs);
comb = nchoosek(1:n,2);
for i=1:size(comb,1)
      dist(i) = conditional_complexity(seqs(comb(i,1)).Sequence,seqs(comb(i,2)).Sequence);
end
 

  phylotree =  seqneighjoin(dist,'equivar',header_mine,'Reroot','false');
%  phylotree = seqlinkage(dist,'single',seqs);
view(phylotree)
toc
a = dist;
b = triu(ones(n),1);
b = b';
b(~~b) = a;
b = b';