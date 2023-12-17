% Clear previous variables and figures
clc;
clear all;
close all;

% Specify the path where the .mat file should be saved
savePath = 'F:\Workspace\MS_THESIS_WORK\BAYESIAN\MCMC_LR_MATLAB';

% Add the specified path to the MATLAB search path
addpath(savePath);

rng(2022);
x = rand(100, 1) * 30;

% Set parameters 
a = 3;
b = 20;
sigma = 5;

% Obtain response and add noise 
y = a * x + b;
noise = randn(100, 1) * sigma;

% Matrix of predictor (1st column) and response (2nd column)
data = [x y] + noise;

% Plot the data
figure;
scatter(data(:, 1), data(:, 2), 'ro', 'filled');
xlabel('X');
ylabel('Y');

% Save the data as a .mat file in the specified path
matFileName = fullfile(savePath, 'synthetic_data.mat');
save(matFileName, 'data');
