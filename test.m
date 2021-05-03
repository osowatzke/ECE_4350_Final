f0 = 6e9;
Z0 = 50;
ZL = 75-1i*20;
[config, X, B, LX, CX, LB, CB] = L_match(ZL, Z0, f0);

f = 0:1e6:10e9;
plot_gamma(f, ZL, Z0, LX(2), CX(2), LB(2), CB(2), config, 0.05)