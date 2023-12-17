function lhd_out_1 = lhd(x, theta)
    % x ----> data matrix |||||| first column --> input and second column --> output
    % theta ---- parameter matrix
    % theta(1) -- a     theta(2) -- b     theta(3) -- sigma
    
    xs = x(:, 1);
    ys = x(:, 2);
    
    % Compute the log likelihood
    pdf_values = normpdf(ys, theta(1) * xs + theta(2), theta(3));
    lhd_out = log(pdf_values);
    lhd_out_1 = sum(lhd_out);
end
