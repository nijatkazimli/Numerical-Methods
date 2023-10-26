ax = axes('XLim',[-3 1],'YLim',[-3 1],'ZLim',[-1 1]);
view(3);
grid on;

[x y z] = cylinder([0.3 0]);
h(1) = surface(x,y,z,'FaceColor','red');
h(2) = surface(x,y,-z,'FaceColor','green');
h(3) = surface(z,x,y,'FaceColor','blue');
h(4) = surface(-z,x,y,'FaceColor','cyan');
h(5) = surface(y,z,x,'FaceColor','magenta');
h(6) = surface(y,-z,x,'FaceColor','yellow');

set(gcf,'Renderer','opengl');

t1 = hgtransform('Parent', ax);
t2 = hgtransform('Parent', ax);
set(h, 'Parent', t1);
h2 = copyobj(h, t2);

Txy = makehgtform('translate', [-1.5 -1.5 0]);
t2.Matrix = Txy;
drawnow

% rotate 5 times
for k = 1:0.1:10*pi
    Rz = makehgtform('zrotate', k);
    t1.Matrix = Rz;
    t2.Matrix = Txy * inv(Rz); % opposite direction
    drawnow
    pause(0.1)
end