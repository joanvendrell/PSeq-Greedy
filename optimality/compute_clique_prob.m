%
% Function to compute the clique probability of l, P[W>l]-P[W>l+1]
%
function clique_prob = compute_clique_prob(p,l)
    p_lb = compute_greater_prob(p,l);
    p_ub = compute_greater_prob(p,l+1);
    clique_prob = p_lb-p_ub;
end