figure(2)
title("MARS 3D VIEW")
fig = figure('Color','black');
img = imread('mars_marble.jpg'); 

[x, y, z] = sphere(100);

scale_x = 3390; % Scale along the x-axis
scale_y =3390; % Scale along the y-axis
scale_z = 3390; % Scale along the z-axis

x = scale_x * x;
y = scale_y * y;
z = scale_z * z;

surface(x, y, z, ...
    'FaceColor', 'texturemap', ... 
    'EdgeColor', 'none', ...       % Remove grid lines
    'CData', img);                 

% Adjust axis properties
axis equal; 
ax.Color = 'black'; % Set axes background to black
view(3);                % Set 3d view
xlabel('X-axis ~ kilometers','Color','white'); 
ylabel('Y-axis ~ kilometers','Color','white'); 
zlabel('Z-axis ~kilometers','Color','white');
grid on;                % Enable grid for reference

% Add lighting
light;                  % Add light source
lighting phong;         % Use Phong lighting for realism
camlight headlight;     % Add light aligned to the camera

% Optional: Set axis limits to focus on the sphere
xlim([-scale_x, scale_x]);
ylim([-scale_y, scale_y]);
zlim([-scale_z, scale_z]);
