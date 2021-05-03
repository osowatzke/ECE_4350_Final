function [S, Z, Y] = convert_ABCD(ABCD, Z0)

    A = ABCD(1,1);
    B = ABCD(1,2);
    C = ABCD(2,1);
    D = ABCD(2,2);

    % determine S matrix
    S = zeros(2,2);
    S(1,1) = (A+B/Z0-C*Z0-D)/(A+B/Z0+C*Z0+D);
    S(1,2) = 2*(A*D-B*C)/(A+B/Z0+C*Z0+D);
    S(2,1) = 2/(A+B/Z0+C*Z0+D);
    S(2,2) = (-A+B/Z0-C*Z0+D)/(A+B/Z0+C*Z0+D);

    % determine Z matrix
    Z = zeros(2,2);
    Z(1,1) = A/C;
    Z(1,2) = (A*D-B*C)/C;
    Z(2,1) = 1/C;
    Z(2,2) = D/C;

    % determine Y matrix
    Y = zeros(2,2);
    Y(1,1) = D/B;
    Y(1,2) = (B*C-A*D)/B;
    Y(2,1) = -1/B;
    Y(2,2) = A/B;

end