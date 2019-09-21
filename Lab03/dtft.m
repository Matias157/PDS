function [X,W] = dtft(x,n)

x = x(:); % Force column vector
n = n(:); % Force column vector

N = length(x); % Number of input points

M = 1024; % Number of DTFT points

W = linspace(-pi,pi,M)'; % Digital frequencies
X = zeros(size(W)); % Initial DTFT values

if ~exist('n','var') % If ’n’ is not given, create
    n = (0:N-1)';
end

for l = 1:M %percorre o W
    for k = 1:N %percorre o n
        X(l) = X(l) + x(k)*exp(-1j*W(l)*n(k));
    end
end