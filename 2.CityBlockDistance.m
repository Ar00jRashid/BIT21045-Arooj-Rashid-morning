% Create a 100x100 binary image
A = zeros(100, 100);

% Define the center of the circle
center_x = 50; % x-coordinate of the center
center_y = 50; % y-coordinate of the center
radius = 20;   % Radius of the circle

% Loop through each pixel in the image
for x = 1:100
    for y = 1:100
        % Calculate the City Block Distance from the center
        D_cityblock = abs(x - center_x) + abs(y - center_y);
        
        % If the distance is equal to the radius, mark it as part of the circle
        if D_cityblock == radius
            A(x, y) = 1; % Set the pixel value to 1 (white)
        end
    end
end

% Display the resulting circle
imshow(A, 'InitialMagnification', 'fit');
title('Circle using City Block Distance');


