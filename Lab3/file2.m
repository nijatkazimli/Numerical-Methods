ax = axes('XLim',[-1.5 1.5],'YLim',[-1.5 1.5],'ZLim',[-1.5 1.5]);
view(3);
grid on;

[x y z] = cylinder([0.2 0]);
h(1) = surface(x,y,z,'FaceColor','red');
h(2) = surface(x,y,-z,'FaceColor','green');
h(3) = surface(z,x,y,'FaceColor','blue');
h(4) = surface(-z,x,y,'FaceColor','cyan');
h(5) = surface(y,z,x,'FaceColor','magenta');
h(6) = surface(y,-z,x,'FaceColor','yellow');

set(gcf,'Renderer','opengl');


t = hgtransform('Parent', ax);
set(h, 'Parent', t);
Rz = eye(4); % rotation around z
Sxy = Rz; % scaling x and y
for k = 1:0.1:2*pi
    Rz = makehgtform('zrotate', k);
    Sxy = makehgtform('scale', k/4);
    t.Matrix = Rz * Sxy; % rotate and expand
    drawnow
end
pause(1)
t.Matrix = eye(4); % to initial