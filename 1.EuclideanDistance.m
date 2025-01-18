% Initialize a 100x100 black image
A = zeros(100, 100);

% Center of the circle
centerX = 50; % x-coordinate of the center
centerY = 50; % y-coordinate of the center

% Radius of the circle
radius = 20;

% Loop through each pixel in the image
for i = 1:100 % Loop over rows (y-coordinates)
    for j = 1:100 % Loop over columns (x-coordinates)
        % Calculate Euclidean distance from the center
        distance = sqrt((i - centerY)^2 + (j - centerX)^2);
        
        % If the distance is approximately equal to the radius, mark it
        if abs(distance - radius) < 0.5
            A(i, j) = 1; % Set the pixel to white
        end
    end
end

% Display the image
imshow(A);
title('Circle drawn using Euclidean distance');

% Save the output image
imwrite(A, 'circle_output.png');

