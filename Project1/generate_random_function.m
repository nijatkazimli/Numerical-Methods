function random_func = generate_random_function()
    % Generate a random function in Cartesian coordinates with various forms
    % You can customize the function generation based on your requirements
    
    % Randomly choose a function form
    func_type = randi(3); % Choose from 1 to 3
    
    % Generate function based on the chosen type
    if func_type == 1
        % Linear function: ax + by + c
        a = rand() * 10;
        b = rand() * 10;
        c = rand() * 10;
        random_func = @(x, y) a * x + b * y + c;
    elseif func_type == 2
        % Quadratic function: ax^2 + by^2 + cxy + dx + ey + f
        a = rand() * 10;
        b = rand() * 10;
        c = rand() * 10;
        d = rand() * 10;
        e = rand() * 10;
        f = rand() * 10;
        random_func = @(x, y) a * x.^2 + b * y.^2 + c * x .* y + d * x + e * y + f;
    else
        % Trigonometric function: a*sin(bx) + c*cos(dy)
        a = rand() * 10;
        b = rand() * 10;
        c = rand() * 10;
        d = rand() * 10;
        random_func = @(x, y) a * sin(b * x) + c * cos(d * y);
    end
end
