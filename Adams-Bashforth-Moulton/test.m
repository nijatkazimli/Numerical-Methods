function test()
    y0 = 1;
    % Make sure h = 5e-5 in ABM.m file!
    tspan = 0:5e-5:1;

    % Test polynomial functions
    disp('Polynomial functions')
    num_of_polynomials = 10;
    mean_errors_polynomial = zeros(num_of_polynomials, 1);
    mean_times_polynomial = zeros(num_of_polynomials, 1);
    logarithmics = cell(num_of_polynomials, 1);
    trigonometrics = cell(num_of_polynomials, 1);
    for i = 1:num_of_polynomials
        % Generate random coefficients and exponents for polynomial functions
        polyCoeffX = rand();
        polyExponentX = rand();

        polyCoeffY = rand();
        polyExponentY = rand();

        % Create polynomial functions and related logarithmic/trigonometric functions
        polyFunction = @(x, y) polyCoeffX*x.^polyExponentX + polyCoeffY*y.^polyExponentY;
        trigonometrics{i} = @(x, y) sin(polyCoeffX*x.^polyExponentX) + cos(polyCoeffY*y.^polyExponentY);
        logarithmics{i} = @(x, y) log(polyCoeffX*x.^polyExponentX + polyCoeffY*y.^polyExponentY);        


        % Use ode45 to calculate the integral for comparison
        [~, builtIn] = ode45(polyFunction, tspan, y0);

        % Measure execution time for the custom method
        tic;
        numericalResult = AdamsBashforthMoulton(polyFunction, tspan, y0);
        timeSpent = toc;

        % Calculate relative error
        relativeError = norm(builtIn - numericalResult) / norm(builtIn) * 100;

        % Accumulate relative errors and times for mean calculation
        mean_errors_polynomial(i) = relativeError;
        mean_times_polynomial(i) = timeSpent;

        % Display results for polynomial functions
        fprintf('Function %d:\n', i);
        fprintf('  Relative Error:\t %f\n', relativeError);
        fprintf('  Time Spent:\t\t %f\n\n', timeSpent);
    end

    % Display mean error and mean time for polynomial functions
    meanErrorPolynomial = mean(mean_errors_polynomial);
    meanTimePolynomial = mean(mean_times_polynomial);
    fprintf('Mean Relative Error (Polynomial Functions):\t %f\n', meanErrorPolynomial);
    fprintf('Mean Time Spent (Polynomial Functions):\t %f\n\n', meanTimePolynomial);

    % Test trigonometric functions
    disp('Trigonometric Functions')
    num_of_trigonometrics = num_of_polynomials;
    mean_errors_trigonometrics = zeros(num_of_trigonometrics, 1);
    mean_times_trigonometrics = zeros(num_of_trigonometrics, 1);
    for i = 1:num_of_trigonometrics
        % Use integral2 to calculate the integral for comparison
        [~, builtIn] = ode45(trigonometrics{i}, tspan, y0);

        % Measure execution time for the custom method
        tic;
        numericalResult = AdamsBashforthMoulton(trigonometrics{i}, tspan, y0);
        timeSpent = toc;

        % Calculate relative error
        relativeError = norm(builtIn - numericalResult) / norm(builtIn) * 100;

        % Accumulate relative errors and times for mean calculation
        mean_errors_trigonometrics(i) = relativeError;
        mean_times_trigonometrics(i) = timeSpent;

        % Display results for trigonometric functions
        fprintf('Function %d:\n', i);
        fprintf('  Relative Error:\t %f\n', relativeError);
        fprintf('  Time Spent:\t\t %f\n\n', timeSpent);
    end

    % Display mean error and mean time for trigonometric functions
    meanErrorTrigonometrics = mean(mean_errors_trigonometrics);
    meanTimeTrigonometrics = mean(mean_times_trigonometrics);
    fprintf('Mean Relative Error (Trigonometric Functions):\t %f\n', meanErrorTrigonometrics);
    fprintf('Mean Time Spent (Trigonometric Functions):\t %f\n', meanTimeTrigonometrics);


    % Test logarithmic functions
    disp('Logarithmic Functions')
    num_of_logs = num_of_polynomials;
    mean_errors_logs = zeros(num_of_logs, 1);
    mean_times_logs = zeros(num_of_logs, 1);
    for i = 1:num_of_logs
        % Use integral2 to calculate the integral for comparison
        [~, builtIn] = ode45(logarithmics{i}, tspan, y0);

        % Measure execution time for the custom method
        tic;
        numericalResult = AdamsBashforthMoulton(logarithmics{i}, tspan, y0);
        timeSpent = toc;

        % Calculate relative error
        relativeError = norm(builtIn - numericalResult) / norm(builtIn) * 100;

        % Accumulate relative errors and times for mean calculation
        mean_errors_logs(i) = relativeError;
        mean_times_logs(i) = timeSpent;

        % Display results for logarithmic functions
        fprintf('Function %d:\n', i);
        fprintf('  Relative Error:\t %f\n', relativeError);
        fprintf('  Time Spent:\t\t %f\n\n', timeSpent);
    end

    % Display mean error and mean time for logarithmic functions
    meanErrorLogs = mean(mean_errors_logs);
    meanTimeLogs = mean(mean_times_logs);
    fprintf('Mean Relative Error (Logarithmic Functions):\t %f\n', meanErrorLogs);
    fprintf('Mean Time Spent (Logarithmic Functions):\t %f\n\n', meanTimeLogs);

    % Plot the results
    figure;

    subplot(2, 1, 1);
    bar([meanErrorPolynomial, meanErrorLogs, meanErrorTrigonometrics]);
    title('Mean Relative Errors');
    xlabel('Function Type');
    ylabel('Mean Relative Error');
    xticklabels({'Polynomial', 'Logarithmic', 'Trigonometric'});

    subplot(2, 1, 2);
    bar([meanTimePolynomial, meanTimeLogs, meanTimeTrigonometrics]);
    title('Mean Times Spent');
    xlabel('Function Type');
    ylabel('Mean Time Spent (s)');
    xticklabels({'Polynomial', 'Logarithmic', 'Trigonometric'});

    sgtitle('Numerical ODE solving Results');
end