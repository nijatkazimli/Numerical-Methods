function test_polar_integral()    
    constant_func = @(x, y) 1;
    expected_result = pi;
    result = integrateOverUnitCircle(constant_func);
    fprintf('Test 1: Integral result: %f (Expected: %f)\n', result, expected_result);
    
    xy_func = @(x, y) 2*x + 2*y;
    expected_result = 0;
    result = integrateOverUnitCircle(xy_func);
    fprintf('Test 2: Integral result: %f (Expected: %f)\n', result, expected_result);
end
