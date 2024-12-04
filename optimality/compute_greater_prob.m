%
% Function to compute P[W \leq l]
%
function greater_prob = compute_greater_prob(p,l)
    greater_prob = 0;
    n = length(p)+1;
    for i=1:n
        greater_prob = greater_prob + compute_probability(p,i,l);
    end
end