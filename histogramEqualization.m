
function equalizedImage = histogramEqualization(inputImage)
    % Check if the image is RGB and convert to grayscale
    if size(inputImage, 3) == 3
        inputImage = rgb2gray(inputImage);
    end
    
    % Initialize the output image
    equalizedImage = zeros(size(inputImage));
    
    % Calculate the histogram of the input image
    [counts, ~] = imhist(inputImage);
    
    % Compute the cumulative distribution function (CDF)
    cdf = cumsum(counts) / numel(inputImage);
    
    % Perform the histogram equalization
    for i = 1:size(inputImage,1)
        for j = 1:size(inputImage,2)
            equalizedImage(i, j) = cdf(inputImage(i, j) + 1);
        end
    end
    
    % Scale the output image to the full 0-255 range
    equalizedImage = uint8(255 * mat2gray(equalizedImage));
end
