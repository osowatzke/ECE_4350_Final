function [Y1, Y2, Y3] = pi_equiv(Y)
    
    Y1 = Y(1,1)+Y(1,2);
    Y2 = -Y(1,2);
    Y3 = Y(2,2) + Y(1,2);

end 