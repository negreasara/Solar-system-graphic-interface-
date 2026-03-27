figure('Color', 'black', 'Name', 'Earth 3D view');
title("EARTH 3D VIEW", 'Color', 'white');

img = imread('earth_colormap.jpg'); 

[x, y, z] = sphere(100);
daspect([1 1 1]) 
view(30,10)
scale_x = 6371; 
scale_y = 6371; 
scale_z = 6371; 

x = scale_x * x;
y = scale_y * y;
z = scale_z * z;

% textured sphere
surface(x, y, z, ...
    'FaceColor', 'texturemap', ... 
    'EdgeColor', 'none', ...       
    'CData', img);                
hold on; 

axis equal; 
ax = gca;
ax.Color = 'black'; 
ax.XColor = 'white'; 
ax.YColor = 'white'; 
ax.ZColor = 'white'; 

view(3); 
xlabel('X-axis ~ kilometers', 'Color', 'white'); 
ylabel('Y-axis ~ kilometers', 'Color', 'white'); 
zlabel('Z-axis ~ kilometers', 'Color', 'white');

grid on;
ax.GridColor = 'white'; 

light; 
lighting phong; 
camlight headlight; 

xlim([-scale_x, scale_x]);
ylim([-scale_y, scale_y]);
zlim([-scale_z, scale_z]);

ax.TickLabelInterpreter = 'none'; 
ax.XColor = 'white'; 
ax.YColor = 'white'; 
ax.ZColor = 'white'; 
