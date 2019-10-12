function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% we need to return the following variables correctly 
J = 0;


% ============================================
%         we should complete the code by working through the
%         following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, we can verify that our
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. we should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, we can check
%         that our implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. we need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%               We recommend implementing backpropagation using a for-loop
%               over the training examples if we are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%               we can implement this around the code for
%               backpropagation. That is, we can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
a1 = [ones(m ,1) X];
a2 = [ones(m,1) sigmoid((Theta1*a1')')];
a3 = sigmoid((Theta2*a2')');
%y is not in form that we want so making another output using y
yVec = zeros(m,num_labels);
for i = 1:m
yVec(i,y(i)) = 1;
end
%cost function and regularization----
Theta1_bias = zeros(size(Theta1));
Theta1_bias(:,1)=Theta1(:,1);
Theta1_bias=Theta1-Theta1_bias;
Theta2_bias = zeros(size(Theta2));
Theta2_bias(:,1)=Theta2(:,1);
Theta2_bias=Theta2-Theta2_bias;
regularization = 1/(2*m)*lambda*[sum(sum(Theta1.^2))+ sum(sum(Theta2.^2)) - (sum(sum(Theta1(:,1).^2)) + sum(sum(Theta2(:,1).^2)))];
J = -1/m*(sum(sum(yVec.*(log(a3)))) + sum(sum((1-yVec).*(log(1-a3))))) + regularization;
%Gradient---------
%fist of all find del3
del3 = zeros(m,num_labels);
del3 = a3 - yVec;
%Now calculate del2
del2 = del3*Theta2.*a2.*(1-a2);
%After Calculating del2 now we can calculate delta
delta1 = zeros(size(Theta1));
delta2 = zeros(size(Theta2));
%In the line below as we can see we took del2(:,2:end) because we did not include the bias term as bias term does not have any error because it is always one.
delta1 = delta1 + del2(:,2:end)'*a1;
delta2 = delta2 + del3'*a2;

Theta1_grad = 1/m*(delta1 + lambda*(Theta1_bias)); %here, need to make Theta1 bias a 25x401 matrix make the bias term zero
Theta2_grad = 1/m*(delta2 + lambda*(Theta2_bias));
















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
