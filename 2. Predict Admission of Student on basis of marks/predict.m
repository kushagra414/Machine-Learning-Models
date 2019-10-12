
function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples


% ======================================================================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%

p = zeros(m, 1);
a = (sigmoid(theta'* X'))';
b = zeros(m, 1);
for n = 1:m
 if (a(n,1)>=0.5)
  b(n,:) = 1;
 elseif (a(n,1)<0.5)
  b(n,:) = 0;
 endif
endfor
p = b;



% =========================================================================


end
