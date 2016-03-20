
function [s0, s1, s2,U] = tausworthe(s0, s1, s2)

mask1 = fi(1,0, 32,0);
mask2 = fi(1,0, 32,0);
mask3 = fi(1,0, 32,0);

mask1.hex = 'fffffffe';
mask2.hex = 'fffffff8';
mask3.hex = 'fffffff0';

b= fi(1, 0, 32, 0);
b = bitsrl(bitxor(bitsll(s0, 13), s0),19);
s0 = bitxor(bitsll(bitand(s0,mask1),12),b);
b = bitsrl(bitxor(bitsll(s1, 2), s1),25);
s1 = bitxor(bitsll(bitand(s1,mask2),4),b);
b = bitsrl(bitxor(bitsll(s2, 3), s2),11);
s0 = bitxor(bitsll(bitand(s2,mask3),17),b);
%output U
U = bitxor(s0, s1);
U = bitxor(U, s2);

end

