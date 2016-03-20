
s0 = fi(0, 0, 32, 0);
s1 = fi(0, 0, 32, 0);
s2 = fi(0, 0, 32, 0);
s3 = fi(0, 0, 32, 0);
s4 = fi(0, 0, 32, 0);
s5 = fi(0, 0, 32, 0);
% s0 = 0x7fffffff 2147483647
s0.hex = '7fffeeee';
s1.hex = '7ddddddd';
s2.hex = '7dddeeee';
s3.hex = '7fffffff';
s4.hex = '7eeeeeee';
s5.hex = '7dddcccc';

X0 = fi(ones(0,10000),1,16,11);
X1 = fi(ones(0,10000),1,16,11);


for i = 1:10000
[X0(1,i), X1(1, i), s0, s1, s2, s3, s4, s5] = AWGN(s0, s1, s2, s3, s4, s5);
end

histogram(X1.data)

