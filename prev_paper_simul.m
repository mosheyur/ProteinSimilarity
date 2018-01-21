clear all
close all
clc

load prev_data
dist = x;
sp_order = {'Blue whale', 'Bornear orangutan', 'Cat','Common chimpanzee','Fin whale', 'Gibbon', 'Gorilla', 'Gray seal', 'Habor seal', 'Human', 'Horse','Mouse', 'Opossum' , 'Pigmy Chimpanzee','Platypus','Rat', 'Rhino','Sumantran Orangutan', 'Wallaroo' ,'Tiger','Korean bovine', 'Spain bovine' };

seqs = struct([]);
fieldname = 'Header';

for i = 1:length(sp_order)
    seqs(i).(fieldname) = char(sp_order(i)) ;
end

phylotree = seqlinkage(dist,'single',seqs);
view(phylotree)
