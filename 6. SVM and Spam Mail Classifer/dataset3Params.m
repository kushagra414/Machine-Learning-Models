function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns our choice of C and sigma for Part 3 of the exercise
%where we select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns our choice of C and 
%   sigma. we should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% we need to return the following variables correctly.
C = 1;
sigma = 0.3;

% =================================================
% Fill in this function to return the optimal C and sigma
% learning parameters found using the cross validation set.
% we can use svmPredict to predict the labels on the cross
% validation set. For example, 
%     predictions = svmPredict(model, Xval);
% will return the predictions on the cross validation set.
%
%  Note: we can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Values=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
error=zeros(size(Values'), size(Values'));
for i = 1:size(Values,2)
     sigTest = Values(1,i);
     for j = 1:size(Values,2)
         CTest = Values(1,j);
         model= svmTrain(X, y, CTest, @(x1, x2) gaussianKernel(x1, x2, sigTest));
         predictions=svmPredict(model, Xval);
         error(i,j)=mean(double(predictions ~= yval));
     end
end
error = error(:);
num=min(error);
error=reshape(error(1:size(Values').^2),size(Values'),size(Values'));
[i,j]=find(error==num);
sigma=Values(i);
C=Values(j);


% =========================================================================

end
