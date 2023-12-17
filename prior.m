function prior_out = prior(theta)
    % Compute the log prior
    mu = [0, 0];
    sigma = eye(2) * 100;
    prior_out = log(mvnpdf(theta(1:2), mu, sigma));
    
end
