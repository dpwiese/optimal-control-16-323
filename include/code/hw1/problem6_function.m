%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Daniel Wiese
% 16.323 - HW #1
%-------------------------------------------------------------------------------
% This is the objective function for the minimization problem with inequality
% constraints.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = problem6_function(X)
    x = X(1);
    y = X(2);
    f = x^2 + y^2 - 6 * x * y - 4 * x - 5 * y;
end
