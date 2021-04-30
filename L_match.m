% function determines configuration and LC matching elements
% if config = 1 => B in parallel with ZL
% if config = 0 => X in series with ZL
% function also returns X and B
% jX represents an inductance and jB represents and admittance

% CX = -1 if X is implemented as an inductor
% LX = -1 if X is implemented as a capacitor

% CB = -1 if B is implemented as an inductor
% LB = -1 if B is implemented as a capacitor

function [config, X, B, LX, CX, LB, CB] = L_match(ZL, Z0, f)
    
    % Determine RL and XL (ZL = 1i*XL + RL)
    RL = real(ZL);
    XL = imag(ZL);
    
    % determine network type
    % B is in parallel with the load if zL is inside the unit circle
    % X is in series with the load if zL is outside the unit circle
    
    % if RL > Z0 => zL is inside the unit circle
    % if RL < Z0 => zL is outside the unit circle
    
    % case ckt is already matched return an error message
    if RL == Z0 && XL == 0
        error("Circuit is already matched");
    % zL inside the unit circle
    elseif RL >= Z0 
        config = 1;
        
        % determine B (note there are 2 solutions)
        B = zeros(1,2);
        B(1) = (XL + sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL))/(RL^2+XL^2);
        B(2) = (XL - sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL))/(RL^2+XL^2);
    
        % determine X 
        X = 1./B+XL.*Z0./RL-Z0./(B.*RL);
        
    % zL outside the unit circle
    else
        config = 0;
        
        % determine X (2 solutions)
        X = zeros(1,2);
        X(1) = sqrt(RL*(Z0-RL))-XL;
        X(2) = -sqrt(RL*(Z0-RL))-XL;
        
        % determine B (2 solutions)
        % B and X should have same sign
        B = zeros(1,2);
        B(1) = sqrt((Z0-RL)/RL)/Z0;
        B(2) = -sqrt((Z0-RL)/RL)/Z0;
    end
    
    % determine whether X and B should be capacitors or inductors
    % there are 2 solutions so there should be L and C should be 1x2
    LX = zeros(1,2);
    CX = zeros(1,2);
    LB = zeros(1,2);
    CB = zeros(1,2);
    
    for n = 1:2 
        if X(n) >= 0
            LX(n) = X(n)/(2*pi*f);
            CX(n) = -1;
        else
            LX(n) = -1;
            CX(n) = 1/(-X(n)*2*pi*f);
        end
        if B(n) >= 0
            CB(n) = B(n)/(2*pi*f);
            LB(n) = -1;
        else
            CB(n) = -1;
            LB(n) = 1/(-B(n)*2*pi*f);
        end
    end
    
    % output circuit type
    if config == 1 
        fprintf("Place B in Parallel with Load when Matching\n");
    else
        fprintf("Place X in Series with Load when Matching\n");
    end
    
    % output capacitance and inductance values for each configuration
    for n = 1:2
        fprintf("\nFor Configuration %d\n",n);
        if CB(n) == - 1
            fprintf("\tUse a Inductance for Admittance B: L = %g H\n", LB(n));
        else
            fprintf("\tUse a Capacitance for Admittance B: C = %g F\n", CB(n));
        end
        if CX(n) == - 1
            fprintf("\tUse a Inductance for Impedance X: L = %g H\n", LX(n));
        else
            fprintf("\tUse a Capacitance for Impedance X: C = %g F\n", CX(n));
        end
    end
end