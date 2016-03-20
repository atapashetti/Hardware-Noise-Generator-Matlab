function [s,U] = tausworthe(clock, s)
if (clock == 1)
b = bitror(bitxor(bitrol(s, 13), s),19);
% initializing a random number a = 0x7ddddddd
a= fi(2111667677, 1, 32, 0);
s = bitxor(bitrol(bitand(s, (bitrol(a, 4))),12),b);
%output U
U = bitxor(s, b)
end
end

% s0 = 0x7fffffff
%s0 = fi(2147483647, 1, 32, 0);
% s1 = 0x70000000
%s1 = fi(1879048192, 1, 32, 0);


