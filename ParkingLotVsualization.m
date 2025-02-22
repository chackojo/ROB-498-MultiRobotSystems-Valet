% Parking Lot Visualization with specified column-lane pattern

% Set up the figure
figure('Position', [100, 100, 800, 600]);
hold on;
grid on;

% Define parking lot dimensions (in meters)
lot_width = 80;
lot_height = 60;

% Define parking spot dimensions
spot_length = 5;    % Length of a parking spot
spot_width = 2.5;   % Width of a parking spot
lane_width = 6;     % Width of driving lanes

% Calculate number of possible spots vertically
num_spots = floor((lot_height-2*lane_width) / spot_width);

% Calculate x-positions for columns and lanes
% Pattern: column | lane | column column | lane | column
col1_x = 0;                                    % First column
lane1_x = spot_length + lane_width/2;                         % First lane
col2_x = lane1_x + lane_width/2;                % Second column
col3_x = col2_x + spot_length;              % Third column (back-to-back with second)
lane2_x = col3_x + spot_length + lane_width/2;               % Second lane
col4_x = lane2_x + lane_width/2;                % Fourth column
col5_x = col4_x + spot_length;
lane3_x = col5_x + spot_length + lane_width/2;
col6_x = lane3_x + lane_width/2;
col7_x = col6_x + spot_length;
lane4_x = col7_x + spot_length + lane_width/2;
col8_x = lane4_x + lane_width/2;
col9_x = col8_x + spot_length;
lane5_x = col9_x + spot_length + lane_width/2;
col10_x = lane5_x + lane_width/2;


% Draw the outer boundary of the parking lot
plot([0 lot_width lot_width 0 0], [0 0 lot_height lot_height 0], 'k-', 'LineWidth', 2);

% Draw horizontal lanes (top and bottom)
plot([0 lot_width], [lane_width/2 lane_width/2], 'b--', 'LineWidth', 1.5);
plot([0 lot_width], [lot_height-lane_width/2 lot_height-lane_width/2], 'b--', 'LineWidth', 1.5);

% Draw vertical lanes
plot([lane1_x lane1_x], [0 lot_height], 'b--', 'LineWidth', 1.5);
plot([lane2_x lane2_x], [0 lot_height], 'b--', 'LineWidth', 1.5);
plot([lane3_x lane3_x], [0 lot_height], 'b--', 'LineWidth', 1.5);
plot([lane4_x lane4_x], [0 lot_height], 'b--', 'LineWidth', 1.5);
plot([lane5_x lane5_x], [0 lot_height], 'b--', 'LineWidth', 1.5);

% Draw parking spots
for spot = 0:num_spots-1
    y_base = lane_width + spot*spot_width;
    
    % Column 1 (facing right)
    rectangle('Position', [col1_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 2 (facing right)
    rectangle('Position', [col2_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 3 (facing left)
    rectangle('Position', [col3_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 4 (facing left)
    rectangle('Position', [col4_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);

    % Column 5 (facing left)
    rectangle('Position', [col5_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 6 (facing left)
    rectangle('Position', [col6_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 7 (facing left)
    rectangle('Position', [col7_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 8 (facing left)
    rectangle('Position', [col8_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);

    % Column 9 (facing left)
    rectangle('Position', [col9_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
    
    % Column 10 (facing left)
    rectangle('Position', [col10_x, y_base, spot_length, spot_width], 'EdgeColor', 'k', 'LineWidth', 1);
end

% Add entrance/exit at bottom left
entrance_width = 6;
rectangle('Position', [0, 0, entrance_width, 2], 'FaceColor', 'g', 'EdgeColor', 'g');
text(entrance_width/2, -2, 'Entrance/Exit', 'HorizontalAlignment', 'center');

% Add destination point (star) at top right
plot(lot_width-2, lot_height-2, 'b*', 'MarkerSize', 10);
text(lot_width-2, lot_height-2, 'Destination', 'HorizontalAlignment', 'right');

% Set axes properties
axis([-5 lot_width+5 -5 lot_height+5]);
xlabel('x [m]');
ylabel('y [m]');
title('Parking Lot Layout');

% Make axes equal to preserve aspect ratio
axis equal;
grid on;

% Add legend
legend('Lot Boundary', 'Driving Lanes', 'Location', 'southeast');