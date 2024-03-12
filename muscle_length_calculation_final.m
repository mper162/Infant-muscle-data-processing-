clc;
clear all;

maskData = niftiread('Gracilis-R_segmentation.nii');

% Initialize an array to store the centroids for each slice
slice_centroids = zeros(size(maskData, 3), 3);

% Iterate through each slice and calculate the centroid
for slice = 1:size(maskData, 3)
    % Extract the binary mask for the current slice
    slice_mask = maskData(:, :, slice);

    % Calculate the centroid of the binary mask using the 'regionprops' function
    stats = regionprops3(slice_mask, 'Centroid');
    
    % Check if centroids exist for the current slice
    if ~isempty(stats) && ~all(isnan(stats.Centroid(:)))
        % Filter out NaN centroids
        valid_indices = ~isnan(stats.Centroid(:,1)); % Assuming Centroid is a Nx3 matrix where each row represents the centroid coordinates for a region
        stats2 = stats.Centroid(valid_indices, :);
        
        % Store centroids only if they exist
        slice_centroids(slice, :) = stats2(1,:); % Assuming you want to store only the first centroid if multiple centroids exist
    end
end

% Filter out zero rows (slices without centroids)
slice_centroids = slice_centroids(any(slice_centroids,2), :);

% Calculate distances and muscle length as before
distances = zeros(size(slice_centroids, 1), 1);
for i = 2:size(slice_centroids, 1)
    prevCentroid = slice_centroids(i - 1,:);
    currentCentroid = slice_centroids(i,:);
    distances(i) = pdist([prevCentroid; currentCentroid],'euclidean');
    if distances(i) > 50 % to filter out abnormal values
        distances(i) = 0;
    end
end

% Convert distances to millimeters
distances_mm = distances * [0.3, 0.3, 3]; % Voxel size is assumed to be 0.3x0.3x3 mm

% Calculate total muscle length in millimeters
muscleLength_mm = sum(distances_mm);

muscleLength_final = norm(muscleLength_mm);

fprintf('Total Muscle Length: %.2f mm\n', muscleLength_final);
