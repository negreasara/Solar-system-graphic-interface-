close all;

Fig=figure('Name','II. Venus',... 
           'Units','normalized',...
           'Position',[0.1 0.1 0.8 0.7],...
           'color',[0.8 0.7 0.4],...
           'NumberTitle','off');

radius_venus();
uicontrol('Style','text',... 
        'Units','normalized',...
        'Position',[0.3 0.9 0.35 0.1],...
        'backgroundcolor',[0.8 0.7 0.4],...',...
        'foregroundcolor','white',...
        'Fontname','Times New Roman',...
        'FontWeight','Bold',...
        'FontSize',25,...
        'String','Venus Characteristics');

img = imread('venus_colormap.jpg'); %texture for Venus

[x, y, z] = sphere(100); 

scale_x = 6052; 
scale_y = 6052;
scale_z = 6052; 

x = scale_x * x;
y = scale_y * y;
z = scale_z * z;


surface(x, y, z, ...
    'FaceColor', 'texturemap', ... 
    'EdgeColor', 'none', ...       
    'CData', img);                 

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

