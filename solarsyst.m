
close all;

Fig=figure('Name','The Solar System',... 
           'Units','normalized',...
           'Position',[0.1 0.1 0.8 0.7],...
           'color','black',...
           'NumberTitle','off');

uicontrol('Style','text',... 
        'Units','normalized',...
        'Position',[0.3 0.85 0.35 0.1],...
        'backgroundcolor','black',...',...
        'foregroundcolor','white',...
        'Fontname','Times New Roman',...
        'FontWeight','Bold',...
        'FontSize',20,...
        'String','SOLAR SYSTEM 3D VIEW');

[x, y, z] = sphere(100);

% Planet Data (Name, Radius in kilometers, Texture File, Offset along x-axis)
planets = {
    'Mercury', 2440, 'mercury_colormap.jpg', -390000;
    'Venus', 6052, 'venus_colormap.jpg', -350000;
    'Earth', 6371, 'earth_colormap.jpg', -300000;
    'Mars', 3390, 'mars_colormap.jpg', -250000;
    'Jupiter', 69911, 'jupiter_colormap.jpg', -130000;
    'Saturn', 58232, 'saturn_colormap.jpg', 70000;
    'Uranus', 25362, 'uranus_colormap.jpg', 200000;
    'Neptune', 24622, 'neptune_colormap.jpg', 320000;
};

for i = 1:size(planets, 1)
    % Extract planet data
    planet_name = planets{i, 1};
    radius = planets{i, 2};
    texture_file = planets{i, 3};
    x_offset = planets{i, 4};
    
    img = imread(texture_file);
    
    x_scaled = radius * x + x_offset; % Apply x-axis offset
    y_scaled = radius * y;
    z_scaled = radius * z;
    
    surface(x_scaled, y_scaled, z_scaled, ...
        'FaceColor', 'texturemap', ...
        'EdgeColor', 'none', ...
        'CData', img);
end

%axis properties
axis equal; 
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
ax.GridColor = 'white';

light;
lighting phong;
material dull;
camlight headlight; 

xlim([-400000, 400000]);
ylim([-80000, 80000]);
zlim([-100000, 100000]);

ax.TickLabelInterpreter = 'none'; 
ax.XColor = 'white';
ax.YColor = 'white'; 
ax.ZColor = 'white'; 

 %closebutton
 uicontrol('style','pushbutton',...
          'Units','normalized',...
          'Position',[0.85 0.05 0.10 0.06],...
          'string','CLOSE',...
          'FontName','Times New Roman',...
          'FontSize',12,...
           'backgroundcolor','black',...',...
        'foregroundcolor','white',...
          'Callback','interface');
