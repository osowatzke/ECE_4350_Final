% function generates a (num+1) x (num+1) table of cutoff frequencies
% u = permeability of material
% e = permittivity of material
% a = largest waveguide dimension
% b = smallest waveguide dimension

function cutoff_rect(u, e, a, b, num)
    
    % empty matrix of cutoff frequencies
    fc = zeros(num+1, num+1);
     
    % loop through values of m and n
    for m = 0:num
        for n = 0:num
            
            % no TEM mode for a rectangular waveguide
            if n == 0 && m ==0 
                fc(1,1) = NaN;
            else
                fc(m+1,n+1)=1/(2*pi*sqrt(u*e))*sqrt((m*pi/a)^2+(n*pi/b)^2);
            end
        end
    end
    
    % display table
    % note that frequencies in table are in GHz
    disp(fc.*1e-9)
end