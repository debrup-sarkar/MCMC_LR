% Set the random seed
clc;
clear all;
close all;

load('synthetic_data.mat');
rng(100);

width = 0.2;
thetas = rand(3, 1);
N = 2000;



for i = 1:N
    if mod(i, 100) == 0
        fprintf('%d\n', i);
    end
    
    % 1. Provide a proposal for theta
    theta_new = proposal(thetas(:, end), width);
    
    % 2. Calculate the likelihood of this proposal and the likelihood
    % For the old value of theta
    log_lik_theta_new = lhd(data, theta_new);
    log_lik_theta = lhd(data, thetas(:, end));
    
    % 3. Evaluate the prior log-pdf at the current
    theta_new_prior = prior(theta_new);
    theta_prior = prior(thetas(:, end));
    
    % 4. Proposal ratio
    prop_ratio = proposal_ratio(thetas(:, end), theta_new, width);
    
    % 5. Assemble the likelihood, prior, and proposal
    likelihood_prior_proposal_ratio = log_lik_theta_new - log_lik_theta + theta_new_prior - theta_prior + prop_ratio;
    
    % Accept or reject the proposal
    if exp(likelihood_prior_proposal_ratio) > rand
        thetas = [thetas theta_new];
    else
        thetas = [thetas thetas(:, end)];
    end
end
