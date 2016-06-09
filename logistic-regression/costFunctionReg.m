function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h=sigmoid((theta'*X')');
k=sum(-y.*log(h)-(1-y).*log(1-h));
J=1/m*k;
grad=1/m.*((h-y)'*X)';
gradadd=lambda/m.*theta;
gradadd(1)=0;
grad=grad+gradadd;
sumthetasquare=sum(theta.^2);
sumthetasquare=sumthetasquare-theta(1)^2;
Jadd=lambda/(2*m).*(sumthetasquare);
J=J+Jadd;



% =============================================================

end