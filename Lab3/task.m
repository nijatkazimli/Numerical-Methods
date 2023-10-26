[X, Y] = meshgrid(-2:0.1:2, -2:0.1:2);
Z = X.^2 + Y.^2;

figure;
ax = axes;
surfPlot = surf(X, Y, Z, 'Parent', ax);
axis equal;
axis off;

h = hgtransform('Parent', ax);
set(surfPlot, 'Parent', h);

numFrames = 240;
angleIncrement = 2 * pi / numFrames;

for frame = 1:numFrames
    rotationMatrix = makehgtform('zrotate', angleIncrement * frame);
    set(h, 'Matrix', rotationMatrix);
    
    drawnow;
end