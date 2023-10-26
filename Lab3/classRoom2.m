x = linspace(0, 10, 1000);
y = sin(x);
plot(x,y)
axis manual
ax = gca; % returns handle to the current axis in the current figure
h = hgtransform('Parent', ax);
plot(x(1), y(1), 'o', 'MarkerFaceColor','red', 'Parent', h);
t = text(x(1), y(1), num2str(y(1)), 'VerticalAlignment', 'top', ...
    'FontSize', 14, 'Parent', h);

for k = 2:length(x)
    h.Matrix = makehgtform('translate', x(k) - x(1), y(k) - y(1), 0);
    t.String = num2str(y(k));
    drawnow
end