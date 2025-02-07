% Read the input image from file
I = imread('sun.jpg');

% Display the original input image
figure('Name', 'Original Image'); % Create a new figure window
imshow(I); % Show the image
title('Original Image'); % Set title for the figure

% Step 2: Analyze the histogram of the image
figure('Name', 'Histogram'); % Create a new figure window for histogram
imhist(I); % Display the histogram of the image
title('Image Histogram'); % Set title for the histogram plot

% Compute the optimal threshold level using Otsu's method
level = graythresh(I); 

% Manually set threshold level (optional, as it's already computed)
%level = 0.4941; Set a predefined threshold value

% Convert the grayscale image to a binary image using the threshold
BW = im2bw(I, level);

% Display the binary (black and white) image after thresholding
figure('Name', 'Enhanced Image'); % Create a new figure window for output image
imshow(BW); % Show the thresholded binary image
title('Output Image'); % Set title for the output image
