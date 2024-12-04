%
% Function to compute the clique number in brute force
%
function [clique_num,alpha] = probabilistic_force(prob)
    n = length(prob)+1;
    clique_num = 0; 
    alpha = 0;
    prob_acc = 0;
    for i=1:n
        clique = i;
        clique_prob = compute_clique_prob(prob,i);
        alpha = alpha + (1/(2+n-clique))*clique_prob;
        clique_num = clique_num + (clique)*clique_prob;
        fprintf('- The clique size computing is %d so the max gap is %d with prob %d\n',clique,1/(2+n-clique),clique_prob)
        fprintf('if n is %d, then denominator is %d\n',n,2+n-clique)
        prob_acc = prob_acc + clique_prob;
    end
    fprintf('The total prob sum is %d\n',prob_acc)
end