%% K-Means Clustering Compression on an Image

%% Initialization
clear ; close all; clc

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

% Loading an image
A = double(imread('spider.jpg'));

A = A / 255; % Dividing by 255 so that all values are in the range 0 - 1

% Size of the image
img_size = size(A);

% Reshape the image into an Nx3 matrix where N = number of pixels.
% Each row will contain the Red, Green and Blue pixel values
% This gives us our dataset matrix X that we will use K-Means on.
X = reshape(A, img_size(1) * img_size(2), 3);

% Setting K colors to define the image
K = 16; 

% Setting max no.of iterations
max_iters = 10;

% Randomly initializing initial centroids
initial_centroids = kMeansInitCentroids(X, K);

% Running K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('Program paused. Press enter to continue.\n');
pause;

% Moving on to image compression ---

fprintf('\nApplying K-Means to compress an image.\n\n');

% Find closest cluster members
idx = findClosestCentroids(X, centroids);

% Essentially, now we have represented the image X as in terms of the
% indices in idx. 

% We can now recover the image from the indices (idx) by mapping each pixel
% (specified by its index in idx) to the centroid value
X_recovered = centroids(idx,:);

% Reshaping the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Displaying the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Displaying compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));


fprintf('Program paused. Press enter to continue.\n');
pause;

