% function determine the standing wave ratio given the reflection
% coefficient. function also works with the absolute value of the
% reflection coefficient
function S = swr(G)
    S = (1+abs(G))/(1-abs(G));
end