figure('Color', 'black', 'Name', 'Neptune 3D view');
title("NEPTUNE 3D VIEW", 'Color', 'white');

img = imread('neptune_colormap.jpg'); % Load texture for Mercury

[x, y, z] = sphere(100); % Generate sphere

scale_x = 24622; 
scale_y = 24622; 
scale_z = 24622; 

x = scale_x * x;
y = scale_y * y;
z = scale_z * z;

% Create the textured sphere
surface(x, y, z, ...
    'FaceColor', 'texturemap', ... % Use the texture from the image
    'EdgeColor', 'none', ...       % Remove grid lines
    'CData', img);                 % Map the image to the sphere

% Adjust axis properties
axis equal; % Ensure equal scaling
ax = gca; % Get current axes handle
ax.Color = 'black'; % Set axes background to black
ax.XColor = 'white'; % Set x-axis color to white
ax.YColor = 'white'; % Set y-axis color to white
ax.ZColor = 'white'; % Set z-axis color to white

view(3); 
xlabel('X-axis ~ kilometers', 'Color', 'white'); 
ylabel('Y-axis ~ kilometers', 'Color', 'white'); 
zlabel('Z-axis ~ kilometers', 'Color', 'white');

grid on;
ax.GridColor = 'white'; % Set grid color to white

light; % Add light source
lighting phong; % Use Phong lighting for realism
camlight headlight; % Add light aligned to the camera

% Optional: Set axis limits to focus on the sphere
xlim([-scale_x, scale_x]);
ylim([-scale_y, scale_y]);
zlim([-scale_z, scale_z]);

% Set tick labels to white for better visibility
ax.TickLabelInterpreter = 'none'; % Default interpreter for tick labels
ax.XColor = 'white'; % White tick labels for x-axis
ax.YColor = 'white'; % White tick labels for y-axis
ax.ZColor = 'white'; % White tick labels for z-axis
