%{function filtered_image = mean_filter(image, kernel_size)
    % Check if kernel size is odd
    %if mod(kernel_size, 2) == 0
        %error('Kernel size must be an odd number');
    %end

    % Create the mean filter kernel
    %kernel = ones(kernel_size) / (kernel_size^2);

    % Pad the image
    %pad_size = floor(kernel_size / 2);
    %padded_image = padarray(image, [pad_size pad_size], 'replicate');

    % Apply the mean filter
    %filtered_image = conv2(padded_image, kernel, 'same');

    % Crop the image to original size
    %filtered_image = filtered_image(pad_size + 1:end - pad_size, pad_size + 1:end - pad_size);
    %end
    function filtered_image = mean_filter(image, kernel_size)
    % Check if kernel size is odd
    if mod(kernel_size, 2) == 0
        error('Kernel size must be an odd number');
    end

    % Convert the image to double precision
    image = double(image);

    % Create the mean filter kernel
    kernel = ones(kernel_size) / (kernel_size^2);

    % Pad the image
    pad_size = floor(kernel_size / 2);
    padded_image = padarray(image, [pad_size pad_size], 'replicate');

    % Apply the mean filter
    filtered_image = conv2(padded_image, kernel, 'same');

    % Convert back to the original data type (e.g., uint8)
    filtered_image = uint8(filtered_image(pad_size + 1:end - pad_size, pad_size + 1:end - pad_size));
end

    
