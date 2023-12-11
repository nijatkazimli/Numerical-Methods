function testFixedFunctions()
    warning off;
    disp('Testing Fixed Functions');
    total = 4;
    functions = cell(total, 1);

    polySlow = @(x, y) x.^2 + y.^2;
    functions{1} = polySlow;

    polyFast = @(x, y) 10.*x.^7 + 8.*y.^9;
    functions{2} = polyFast;

    nonPolyA = @(x, y) log(3.*x.^2 + 2.*y.^3);
    functions{3} = nonPolyA;

    nonPolyB = @(x, y) sin(3.*x.^2) + cos(2.*y.^3);
    functions{4} = nonPolyB;

    for i = 1:total
        polarFunction = @(theta, r) functions{i}(r.*cos(theta), r.*sin(theta)).*r;        
        builtInIntegral = integral2(polarFunction, 0, 2*pi, 0, 1);

        tic;
        numericalResult = integrateOverUnitCircle(functions{i});
        timeSpent = toc;

        if builtInIntegral == 0
            relativeError = abs(builtInIntegral - numericalResult);
        else
            relativeError = abs((builtInIntegral - numericalResult) / builtInIntegral);
        end

        fprintf('Function %d:\n', i);
        fprintf('  Relative Error:\t %f\n', relativeError);
        fprintf('  Time Spent:\t\t %f\n\n', timeSpent);
    end
end
