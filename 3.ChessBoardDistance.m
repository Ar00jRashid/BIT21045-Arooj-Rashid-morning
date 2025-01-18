% Initialize a 100x100 binary image
A = zeros(100, 100);

% Define the circle's center and radius
x_c = 50; % x-coordinate of the center
y_c = 50; % y-coordinate of the center
r = 20;   % Radius of the circle

% Loop through each pixel in the image
for x = 1:size(A, 1)
    for y = 1:size(A, 2)
        % Compute the chessboard distance from the center
        D_chessboard = max(abs(x - x_c), abs(y - y_c));
        
        % Check if the distance equals the radius
        if D_chessboard == r
            A(x, y) = 1; % Set pixel to 1 (white)
        end
    end
end

% Display the resulting image
imshow(A, 'InitialMagnification', 'fit');
title('Circle using Chessboard Distance');

