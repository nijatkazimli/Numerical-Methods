[x, y] = meshgrid(-2:0.2:2, -4:0.4:4); % 2 dimensional version of linspace
z = x .* exp(-x.^2-y^2);
mesh(x,y,z, 'EdgeColor','blue')
surf(x,y,z)
alpha(0.4) % transparency

t = 0:pi/10:2*pi;
[x,y,z] = cylinder(cos(t));
surf(x,y,z)

mrot = makehgtform('zrotate', pi/5); % create a transform matrix.
pv2 = mrot * pv1;

h = hgtransform; % create transform object