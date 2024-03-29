%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Daniel Wiese
% 16.323 - HW #1
%-------------------------------------------------------------------------------
% Function given in problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [f, g] = functionpart3_multiple(x)

    global nf

    nf = nf + 1;

    x1 = x(1);
    x2 = x(2);

    if nargout == 1
        f = 2 * x1^2 - 1.05 * x1^4 + (1/6) * x1^6 - x1 * x2 + x2^2;
    elseif nargout == 2
        f = 2 * x1^2 - 1.05 * x1^4 + (1/6) * x1^6 - x1 * x2 + x2^2;
        dfdx1 = 4 * x1 - 4.2 * x1^3 + x1^5 - x2;
        dfdx2 = -x1 + 2 * x2;
        g = [dfdx1, dfdx2]';
    else
        error('how many output arguements are you using?')
    end

end
