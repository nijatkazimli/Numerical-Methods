function result = integrateOverUnitCircle(f)
    % Parameters for the numerical integration
    num_theta = 1000; % Number of divisions in the angular direction
    num_r = 1000;    % Number of divisions in the radial direction

    % Calculate the differentials in theta and r
    delta_theta = 2 * pi / num_theta; % Angular step size
    delta_r = 1 / num_r;              % Radial step size

    % Initialize the result variable to store the accumulated integral
    result = 0;

    % Double loop over theta and r for numerical integration
    for i = 1:num_theta
        % Calculate the current angle theta
        theta = (i - 0.5) * delta_theta;

        for j = 1:num_r
            % Calculate the current radius r
            r = (j - 0.5) * delta_r;

            % Convert polar coordinates to Cartesian coordinates
            x = r * cos(theta);
            y = r * sin(theta);

            % Evaluate the function at the current Cartesian coordinates
            f_val = f(x, y);

            % Calculate the differential area element in polar coordinates
            area_element = r * delta_r * delta_theta;

            % Accumulate the product of the function value and the area element
            result = result + f_val * area_element;
        end
    end
end
