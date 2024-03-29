%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Daniel Wiese
% 16.323 - HW #1
%-------------------------------------------------------------------------------
% Rosenbrock function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [f, g] = functionpart1_rosen(x)

    global nf

    nf = nf + 1;

    x1 = x(1);
    x2 = x(2);

    if nargout == 1
        f = (1-x1)^2 + 100 * (x2-x1^2)^2;
    elseif nargout == 2
        f = (1-x1)^2 + 100 * (x2-x1^2)^2;
        dfdx1 = -2 * (1-x1) - 400 * (x2-x1^2) * x1;
        dfdx2 = 200 * (x2-x1^2);
        g = [dfdx1, dfdx2]';
    else
        error('how many output arguements are you using?')
    end

end
