function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



% 1 / 2 * m * sum((hX - y)^2) + lambda / 2 * m * sum(Theta^2)

newTheta1 = theta;
part1 = 1 / (2 * m) * sum((X * newTheta1 - y) .^ 2);
newTheta1(1) = 0;
J = part1 + lambda / (2 * m) * sum(newTheta1.^2);

% 1 / m * sum((X * theta) - y) * X + lambda / m * theta
newtheta2 = theta;
part2 = (1 / m * sum((X * newtheta2 - y) .* X))';
newtheta2(1) = 0;
grad = part2 + lambda / m * newtheta2;


% =========================================================================

grad = grad(:);

end
