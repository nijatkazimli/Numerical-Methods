function [t, y] = AdamsBashforthMoulton(f, tspan, y0, h)
    % Adams-Bashforth-Moulton method of order 2
    % f: function handle for the ODE
    % tspan: [t0, tn] where t0 is the initial time and tn is the final time
    % y0: initial values of the system
    % h: step size

    % Initialize variables
    t = tspan(1):h:tspan(2);
    n = length(t);
    y = zeros(length(y0), n);
    y(:,1) = y0;

    % Use 2nd order Runge-Kutta to calculate Y1
    for i = 1:n-1
        k1 = h * feval(f, t(i), y(:,i));
        k2 = h * feval(f, t(i) + h/2, y(:,i) + k1/2);
        y(:,i+1) = y(:,i) + k2;
    end

    % Predictor-Corrector steps
    for i = 2:n-1
        % Predictor (Adams-Bashforth)
        y_pred = y(:,i) + h/2 * (3 * feval(f, t(i), y(:,i)) - feval(f, t(i-1), y(:,i-1)));

        % Corrector (Adams-Moulton)
        y(:,i+1) = y(:,i) + h/2 * (feval(f, t(i+1), y_pred) + feval(f, t(i), y(:,i+1)));
    end
end