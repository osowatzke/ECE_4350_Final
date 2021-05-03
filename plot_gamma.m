% plot the magnitude of the reflection coefficient vs frequency
% and identify bandwidth
function plot_gamma(f, ZL, Z0, LX, CX, LB, CB, config, GM)
    
    % determine frequency varying values for B and X
    if LB == -1
        B = 2.*pi.*f.*CB;
    else
        B = -1./(2.*pi.*f.*LB);
    end
    if LX == -1
        X = -1./(2.*pi.*f.*CX);
    else
        X = 2.*pi.*f.*LX;
    end
    
    % determine frequency varying value for load impedance
    
    % config = 1 => Admittance jB in parallel with load impedance
    % config = 0 => Impedance jX in series with load impedance
    
    if config == 0
        ZL = 1./(1./(1i.*X+ZL)+1i.*B);
    else
        ZL = 1i.*X+1./(1i.*B+1./ZL);
    end
    
    % empty array for abs value of reflection coefficient
    G = zeros(1,length(f));
    
    % initialize array
    for k = 1:length(f)
        G(k) = abs(refl_coeff(ZL(k),Z0));
    end
    
    % plot absolute value of reflection coefficient
    plot(f.*1e-9,G,f.*1e-9,GM.*ones(1,length(f)));
    
    % label plot
    xlabel('f (GHz)');
    ylabel('|\Gamma|');
      
end