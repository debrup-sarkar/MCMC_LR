function out_theta = proposal(prec_theta, search_width)
    if nargin < 2
        search_width = 0.5;
    end
    
    out_theta = zeros(3,1);
    
    % Generate the first two elements using a multivariate normal distribution
    mu = prec_theta(1:2);
    sigma = eye(2) * (search_width ^ 2);
    out_theta(1:2) = mvnrnd(mu, sigma);
    
    extra_adjust = 500;
    
    % Generate the third element using a gamma distribution
    out_theta(3) = gamrnd(prec_theta(3) * search_width * extra_adjust, 1 / (search_width * extra_adjust));
end
