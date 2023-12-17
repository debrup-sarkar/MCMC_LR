function prop_ratio_out = proposal_ratio(theta_old, theta_new, search_width)
    if nargin < 3
        search_width = 10;
    end
    
    % Calculate the log of the proposal distribution ratios
    mu_old = theta_new(1:2);
    mu_new = theta_old(1:2);
    sigma = eye(2) * (search_width^2);
    prop_ratio_out = log(mvnpdf(mu_old, mu_new, sigma));
    
    alpha_old = theta_new(2) * search_width * 500;
    alpha_new = theta_old(2) * search_width * 500;
    scale = 1 / (500 * search_width);
    prop_ratio_out = prop_ratio_out + log(gampdf(alpha_old, alpha_new, scale));
    
    % Calculate the reverse ratios
    mu_old = theta_old(1:2);
    mu_new = theta_new(1:2);
    prop_ratio_out = prop_ratio_out - log(mvnpdf(mu_old, mu_new, sigma));
    
    alpha_old = theta_old(2) * search_width * 500;
    alpha_new = theta_new(2) * search_width * 500;
    prop_ratio_out = prop_ratio_out - log(gampdf(alpha_old, alpha_new, scale));
end
