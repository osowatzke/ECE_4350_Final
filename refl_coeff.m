% function calculates reflection coefficient
% ZL = load impedance
% Z0 = characteristic impedance
function G = refl_coeff(ZL,Z0)
    G = (ZL-Z0)/(ZL+Z0);
end