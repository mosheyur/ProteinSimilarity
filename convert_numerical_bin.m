function [code_hydro,code_iso] = convert_numerical_bin(tests)
hydro = 'IVLFCMAGTSWYPHDNEQKR';
iso = 'RKHPTIALGVWMSYQFNCED';
code_hydro = zeros(5,length(tests));
code_iso = code_hydro;



for i=1:length(tests)
    code_hydro(:,i) = str2num(dec2bin(find(hydro ==tests(i)),5)');  
    code_iso(:,i) = str2num(dec2bin(find(iso ==tests(i)),5)');
end



