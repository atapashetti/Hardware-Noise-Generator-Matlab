function[x0, x1, s0, s1, s2, s3, s4, s5] = AWGN(s0, s1, s2, s3, s4, s5);
%initializing the outputs of tausworthe functions
a = fi(0, 0, 32, 0);
b = fi(0, 0, 32, 0);

%generating the tausworthe outputs and updating the s0, s1 variables to
%generate next round of tausworthe outputs
[s0, s1, s2, a] =  tausworthe( s0, s1, s2);
[s3, s4, s5, b] =  tausworthe( s3, s4, s5);

%converting the tausworthe outputs to hex
a = a.bin;
b = b.bin;

%create floating point objects U0(48, 48) and U1(16, 16)
U0 = fi(0, 0, 48, 48);
U1 = fi(0, 0, 16, 16);

%concation U0 = [a, b(31:16)]
U0.bin = [a,  b(1:16)];
U1.bin = b(17:32);

%create floating point objects g0(16,15) and g1(16, 15)
g0 = fi(0, 1, 16,15);
g1 = fi(0, 1, 16,15);
[g0.data, g1.data] = sinCosUnit(U1.data);

%create floating point objects f(17, 13) and e(31,24)
f = fi(0, 1, 17, 13);
e = fi(0, 1, 31, 24);

e.data = logUnit(U0.data);
f.data = sqrt(e.data);

%initializing a pair of output noise signals x0(16,11) and x1(16,11)
x0 = fi(0, 1, 16, 11);
x1 = fi(0, 1, 16, 11);

x0.data =f.data .* g0.data;
x1.data =f.data .* g1.data;
end

