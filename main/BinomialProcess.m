%
% Function to apply Binomial Distribution to a random probability vector
%
function [communication] = BinomialProcess(p_success,n_trials)
    communication = zeros(1,length(n_trials));
    for i = 1:numel(n_trials)
        communication(i) = any(binornd(1, p_success(i), 1, n_trials(i)) > 0);
    end
end