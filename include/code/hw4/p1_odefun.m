%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Daniel Wiese
% 16.323 - HW #4
%-------------------------------------------------------------------------------
% These are the differential equations for state and costate for pendulum.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ydot = p1_odefun(t, Y)

    global rho

    x1 = Y(1);
    x2 = Y(2);
    p1 = Y(3);
    p2 = Y(4);

    xdot1 = x2;
    xdot2 = sin(x1)-p2/(2*rho);
    pdot1 = -2*x1-p2*cos(x1);
    pdot2 = -p1;

    Ydot = [xdot1, xdot2, pdot1, pdot2]';

end
