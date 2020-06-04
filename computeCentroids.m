function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. Returns a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.

% Initializing variables
[m n] = size(X);
centroids = zeros(K, n);

% Going over every centroid and computing mean of all points that
% belong to it.
for i = 1:K
	pointList = find(idx == i);
	centroids(i,:) = mean(X(pointList,:));
end

end

