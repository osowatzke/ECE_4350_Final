function ABCD = abcd_lossless_tline(Bl, Z0)
    
    ABCD = [cos(Bl) 1i*Z0*sin(Bl); 1i*(1/Z0)*sin(Bl) cos(Bl)];
    
end