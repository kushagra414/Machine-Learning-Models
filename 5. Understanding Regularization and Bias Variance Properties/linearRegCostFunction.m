function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% =================================================================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               we should set J to the cost and grad to the gradient.
%


% Initialize some useful values
m = length(y); % number of training examples

% we need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
No_bias = theta;
No_bias(1) = 0;
J = (1 / (2*m) ) * sum(((X * theta)-y).^2) + (lambda / (2 * m))*sum(No_bias.^2);
hypothesis = X * theta;
grad = (1 / m) * (X' * (hypothesis-y)) + (lambda/m)*No_bias;




% =========================================================================

grad = grad(:);

end
