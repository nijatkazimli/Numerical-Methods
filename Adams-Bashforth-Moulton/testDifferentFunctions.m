% ODE
f_ode_1 = @(t, y) 5 + sin(t);

% Step Size
h = 5e-5;

% tspan for AdamsBashforthMoulton
tspan_1 = 0:h:0.1;

% tspan for the analytical solution
tspan_1_analytical = 0:0.01:0.1;

% Initial value
y0_1 = 1;

% analytical solution
y_analytical_1 = 5 * tspan_1_analytical - cos(tspan_1_analytical) + 2;

% numerical solution using AdamsBashforthMoulton
y_numerical_1 = AdamsBashforthMoulton(f_ode_1, tspan_1, y0_1);

% interpolation to get y's at the same points of tspan's.
% NOTE: interpolation is necessary. AdamsBashforthMoulton returns
% all the points.
y_numerical_interp_1 = interp1(tspan_1, y_numerical_1, tspan_1_analytical);

% Create a table
resultTable_1 = table(tspan_1_analytical', y_analytical_1', y_numerical_interp_1', 'VariableNames', {'tspan_analytical', 'y_analytical', 'y_numerical_interp'});

% Display the table
disp(resultTable_1);

% -----------------------

f_ode_2 = @(t, y) 3*y + cos(t);

tspan_2 = 0:h:0.1;
tspan_2_analytical = 0:0.01:0.1;
y0_2 = 1;

y_analytical_2 = sin(tspan_1_analytical)/10 - 3*cos(tspan_1_analytical)/10 + 13/10*exp(3*tspan_2_analytical);

y_numerical_2 = AdamsBashforthMoulton(f_ode_2, tspan_2, y0_2);

y_numerical_interp_2 = interp1(tspan_2, y_numerical_2, tspan_2_analytical);

resultTable_2 = table(tspan_2_analytical', y_analytical_2', y_numerical_interp_2', 'VariableNames', {'tspan_analytical', 'y_analytical', 'y_numerical_interp'});
disp(resultTable_2);

% -----------------------

f_ode_3 = @(t, y) y * t;

tspan_3 = 0:h:0.1;
tspan_3_analytical = 0:0.01:0.1;
y0_3 = 1;

y_analytical_3 = exp(tspan_3_analytical.^2 / 2);

y_numerical_3 = AdamsBashforthMoulton(f_ode_3, tspan_3, y0_3);

y_numerical_interp_3 = interp1(tspan_3, y_numerical_3, tspan_3_analytical);

resultTable_3 = table(tspan_3_analytical', y_analytical_3', y_numerical_interp_3', 'VariableNames', {'tspan_analytical', 'y_analytical', 'y_numerical_interp'});
disp(resultTable_3);