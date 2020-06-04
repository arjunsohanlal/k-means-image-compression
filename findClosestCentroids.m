function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Initializations
K = size(centroids, 1);
idx = zeros(size(X,1), 1);

% Going over every example, find its closest centroid, and store
% the index inside idx at the appropriate location.
% idx(i) contains the index of the centroid closest to example i.
m = size(X,1);

for i = 1:m
	dis_vector = sqrt(  sum( (X(i,:) - centroids).^2 ,2)  );
	[minval idx(i)] = min(dis_vector);
end

end

