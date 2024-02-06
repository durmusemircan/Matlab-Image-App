function filtered_image = median_filter(image, kernel_size)
    % Check if kernel size is odd
    if mod(kernel_size, 2) == 0
        error('Kernel size must be an odd number');
    end

    % Pad the image
    pad_size = floor(kernel_size / 2);
    padded_image = padarray(image, [pad_size pad_size], 'replicate');

    % Preallocate the filtered image for efficiency
    [rows, cols, ~] = size(image);
    filtered_image = zeros(rows, cols, class(image));

    % Apply the median filter
    for i = 1:rows
        for j = 1:cols
            % Extract the neighborhood
            neighborhood = padded_image(i:i+2*pad_size, j:j+2*pad_size);
            
            % Compute the median and assign it to the filtered image
            filtered_image(i, j) = median(neighborhood(:));
        end
    end
end
