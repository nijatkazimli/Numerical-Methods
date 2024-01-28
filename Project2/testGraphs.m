% Define ODEs
f_ode_1 = @(t, y) -0.2 * y;
f_ode_2 = @(t, y) -15 * y;

% Time spans
h = 5e-5;
tspan_1 = 0:h:0.1;
tspan_2 = 0:h:0.1;

tspan_1_analytical = 0:1e-7:0.1;
tspan_2_analytical = 0:1e-7:0.1;

% Initial conditions
y0_1 = 1;
y0_2 = 1;

% Analytical solutions
y_analytical_1 = y0_1 * exp(-0.2 * tspan_1_analytical);
y_analytical_2 = y0_2 * exp(-15 * tspan_2_analytical);

% Numerical solutions using Adams-Bashforth-Moulton
y_numerical_1 = AdamsBashforthMoulton(f_ode_1, tspan_1, y0_1);
y_numerical_2 = AdamsBashforthMoulton(f_ode_2, tspan_2, y0_2);

% Plotting
figure;

% Plot for ODE 1
subplot(2, 1, 1);
plot(tspan_1_analytical, y_analytical_1, 'r-', 'LineWidth', 2, 'DisplayName', 'Analytical Solution');
hold on;
plot(tspan_1, y_numerical_1, 'bo-', 'LineWidth', 0.5, 'MarkerSize', 0.5, 'DisplayName', 'Numerical Solution (ABM)');
xlabel('Time (t)');
ylabel('y(t)');
legend('show');
grid on;
hold off;

% Plot for ODE 2
subplot(2, 1, 2);
plot(tspan_2_analytical, y_analytical_2, 'r-', 'LineWidth', 2, 'DisplayName', 'Analytical Solution');
hold on;
plot(tspan_2, y_numerical_2, 'bo-', 'LineWidth', 0.5, 'MarkerSize', 0.5, 'DisplayName', 'Numerical Solution (ABM)');
xlabel('Time (t)');
ylabel('y(t)');
legend('show');
grid on;
hold off;
