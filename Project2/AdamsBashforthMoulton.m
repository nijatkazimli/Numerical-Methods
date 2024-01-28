function y = AdamsBashforthMoulton(f, tspan, y0)
    % Adams-Bashforth-Moulton method of order 2
    % f: function handle for the ODE
    % tspan: [t0, tn] where t0 is the initial time and tn is the final time
    % y0: initial values of the system

    % Initialize variables
    h = 5e-5;
    n = length(tspan);
    y = zeros(n, 1);
    y(1) = y0;

    % Use 2nd order Runge-Kutta to calculate Y1
    K = feval(f, tspan(1) + 1/2*h, y(1) + 1/2*h*feval(f, tspan(1), y(1)));
    Y1 = y(1) + h*K;

    y(2) = Y1;

    % Predictor-Corrector steps
    for i = 2:n-1
        % Predictor (Adams-Bashforth)
        y_pred = y(i) + h/2 * (3 * feval(f, tspan(i), y(i)) - feval(f, tspan(i-1), y(i-1)));

        % Corrector (Adams-Moulton)
        y(i+1) = y(i) + h/2 * (feval(f, tspan(i+1), y_pred) + feval(f, tspan(i), y(i)));
    end
end
