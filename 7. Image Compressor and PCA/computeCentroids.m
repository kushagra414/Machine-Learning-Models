function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. We should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% We need to return the following variables correctly.
centroids = zeros(K, n);


% ================================================================
% Go over every centroid and compute mean of all points that
% belong to it. Concretely, the row vector centroids(i, :)
% should contain the mean of the data points assigned to
% centroid i.
%
% Note: We can use a for-loop over the centroids to compute this.
%
count = 0;
mean = zeros(K,n);
for i = 1:K
	for j = 1:size((X), 1)
		if(i == idx(j))
			mean(i, :) = X(j, :) + mean(i,:);
			count = count + 1;
		end
	end
mean(i,:) = mean(i,:)/count;
count = 0;
end

centroids = mean;






% =============================================================


end

