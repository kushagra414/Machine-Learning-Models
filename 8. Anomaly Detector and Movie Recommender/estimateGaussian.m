function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% ============================================================
% Compute the mean of the data and the variances
% In particular, mu(i) should contain the mean of
% the data for the i-th feature and sigma2(i)
% should contain variance of the i-th feature.
%


% Useful variables
[m, n] = size(X);

% We have to return these values correctly
mu = zeros(n, 1);
mutest=mu';
sigma2 = zeros(n, 1);
sigmatest=sigma2';
for i=1:n
	mutest(i) = (sum(X(:,i)));
endfor
mutest=mutest/m;
for i=1:m
	sigmatest(i,:)=(X(i,:)-mutest).^2;
endfor
sigma2=sum(sigmatest)'/m;
mu=mutest';


% =============================================================


end
