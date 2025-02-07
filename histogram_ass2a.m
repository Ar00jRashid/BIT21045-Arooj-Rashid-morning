function image_analysis(image_path)
    % Check if the file exists
    if ~isfile(image_path)
        error('The specified image file does not exist: %s', image_path);
    end

    % Read the image
    img = imread(image_path);

    % Display the original image
    figure;
    imshow(img);
    title('Original Image');

    % Step a: Determine the type of image
    if islogical(img)
        disp('The image is binary.');
        image_type = 'binary';
    elseif size(img, 3) == 1
        disp('The image is grayscale.');
        image_type = 'grayscale';
    elseif size(img, 3) == 3
        disp('The image is RGB.');
        image_type = 'RGB';
    else
        disp('Unknown image type.');
        return;
    end

    % Convert RGB image to grayscale for analysis
    if strcmp(image_type, 'RGB')
        gray_img = rgb2gray(img);
    else
        gray_img = img;
    end

    % Step b: Analyze the histogram and detect issues
    figure;
    histogram(double(gray_img(:)), 256); % Corrected histogram calculation
    title('Histogram of Grayscale Image');

    % Calculate mean and standard deviation
    mean_intensity = mean(gray_img(:));
    std_intensity = std(double(gray_img(:)));

    % Analyze brightness and contrast
    if mean_intensity < 50
        disp('The image is too dark.');
        issue = 'dark';
    elseif mean_intensity > 200
        disp('The image is too bright.');
        issue = 'bright';
    elseif std_intensity < 30
        disp('The image has low contrast.');
        issue = 'low_contrast';
    else
        disp('The image has normal brightness and contrast.');
        issue = 'none';
    end

    % Step c: Enhance the image if necessary
    switch issue
        case 'dark'
            % Stretch the intensity values to enhance the image
            enhanced_img = imadjust(gray_img, stretchlim(gray_img, [0.01 0.99]), []);
        case 'bright'
            % Stretch the intensity values to reduce brightness
            enhanced_img = imadjust(gray_img, stretchlim(gray_img, [0.01 0.99]), []);
        case 'low_contrast'
            % Enhance contrast using histogram equalization
            enhanced_img = histeq(gray_img);
        otherwise
            % No enhancement needed
            enhanced_img = gray_img;
    end

    % Display the enhanced image
    figure;
    imshow(enhanced_img);
    title('Enhanced Image');
end

% Example usage:
% Replace 'Images/download.png' with your actual image path
image_path = fullfile('..', 'Images', 'download.png'); 
image_analysis(image_path);