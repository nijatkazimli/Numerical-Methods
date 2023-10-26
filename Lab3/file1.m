pv1 = [4  4 -1 -1  2  2  1  1  0  0  3  3; ...
       1  3  3 -1 -1  1  1  0  0  2  2  1; ...
       0  0  0  0  0  0  0  0  0  0  0  0; ...
       1  1  1  1  1  1  1  1  1  1  1  1]; % vertice cordinates are cols
% x y z w z. z always 0, so 2D.
axis equal
xlim([-6 6])
ylim([-6 6])
p1 = patch('FaceColor','blue');
p1.XData = pv1(1,:) ./ pv1(4,:);
p1.YData = pv1(2,:) ./ pv1(4,:);
p1.ZData = pv1(3,:) ./ pv1(4,:);