% function calculates input impedance
% ZL = load impedance
% Z0 = characteristic impedance
% Bl = propagation constant*length
function Zin = input_impedance(ZL, Z0, Bl)
    % if checks for ZL = inf (OC)
    if isinf(ZL)
        Zin = Z0/(1i*tan(Bl));
    else
        Zin = Z0*(ZL+1i*Z0*tan(Bl))/(Z0+1i*ZL*tan(Bl));
    end
end