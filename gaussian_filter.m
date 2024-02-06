function filtered_image = gaussian_filter(image, sigma)
    % Size of the filter: typically 6 times sigma and round up to the nearest odd integer
    filter_size = ceil(sigma * 6);
    filter_size = filter_size + mod(filter_size+1, 2); % Ensure filter size is odd

    % Create a Gaussian filter
    [X, Y] = meshgrid(-floor(filter_size/2):floor(filter_size/2));
    G = exp(-(X.^2 + Y.^2) / (2 * sigma^2));
    G = G / sum(G(:)); % Normalize the kernel

    % Apply the Gaussian filter
    filtered_image = imfilter(image, G, 'same', 'replicate');
end
