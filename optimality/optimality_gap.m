function gap = optimality_gap(p,t)
    for i=1:length(p)
        p(i) = 1 - (1-p(i))^t(i);
    end
    [~,gap] = probabilistic_force(p);
end