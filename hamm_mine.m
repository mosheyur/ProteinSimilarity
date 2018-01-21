function dist = hamm_mine(arr1,arr2)


vec1 = arr1(:);
vec2 = arr2(:);

L = min(length(vec1),length(vec2));

vec1 = vec1(1:L);
vec2 = vec2(1:L);

dist = sum(xor(vec1,vec2));


