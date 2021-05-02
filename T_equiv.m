function [Z1, Z2, Z3] = T_equiv(Z)
    
    Z1 = Z(1,1)-Z(1,2);
    Z2 = Z(1,2);
    Z3 = Z(2,2)-Z(1,2);
    
end