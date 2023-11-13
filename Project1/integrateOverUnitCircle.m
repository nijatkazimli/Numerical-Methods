function result = integrateOverUnitCircle(f)
    num_theta = 100;
    num_r = 100;

    delta_theta = 2 * pi / num_theta;
    delta_r = 1 / num_r;

    result = 0;

    for i = 1:num_theta
        theta = (i - 0.5) * delta_theta;
        for j = 1:num_r
            r = (j - 0.5) * delta_r;
            
            x = r * cos(theta);
            y = r * sin(theta);
            
            f_val = f(x, y);
            
            area_element = r * delta_r * delta_theta;
            
            result = result + f_val * area_element;
        end
    end
end
