function [p, v] = lzd_2(a_2)
a = fi(0, 0, 2, 0);
a.data= 3;
b=bin(a);
p = bitand(~b(2), b(1));
v = bitor(b(2), b(1));
end