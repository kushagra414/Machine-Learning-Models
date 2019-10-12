function [lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval)
%VALIDATIONCURVE Generate the train and validation errors needed to
%plot a validation curve that we can use to select lambda
%   [lambda_vec, error_train, error_val] = ...
%       VALIDATIONCURVE(X, y, Xval, yval) returns the train
%       and validation errors (in error_train, error_val)
%       for different values of lambda. we are given the training set (X,
%       y) and validation set (Xval, yval).
%

% Selected values of lambda (we should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% we need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

% ============================================================
%               Fill in this function to return training errors in 
%               error_train and the validation errors in error_val. The 
%               vector lambda_vec contains the different lambda parameters 
%               to use for each calculation of the errors, i.e, 
%               error_train(i), and error_val(i) should give 
%               we the errors obtained after training with 
%               lambda = lambda_vec(i)
%
% Note: we can loop over lambda_vec with the following:
%
%       for i = 1:length(lambda_vec)
%           lambda = lambda_vec(i);
%           % Compute train / val errors when training linear 
%           % regression with regularization parameter lambda
%           % we should store the result in error_train(i)
%           % and error_val(i)
%           ....
%           
%       end
%
%

n = size(lambda_vec);
J_train = zeros(n);
J_cv = zeros(n);
for i = 1:n
   [theta] = trainLinearReg(X, y, lambda_vec(i));
   [J_train(i)] = linearRegCostFunction(X, y, theta, 0);
   [J_cv(i)] = linearRegCostFunction(Xval, yval, theta, 0);
end
error_train = J_train;
error_val = J_cv;

% =========================================================================

end
