p = fi(0, 0, 1, 0);
v = fi(0, 0, 1, 0);
a = fi(0, 0, 2, 0);
a.data = 3;
[p.data, v.data] = lzd_2(a.data);