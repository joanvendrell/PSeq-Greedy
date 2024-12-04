%
% Function to generate random heterogeneous radius
%
function [agents,radii,randomDom] = generateRandomRadii(p,m,size)
    % Generate list of agents
    agents = 1:p;
    % Generate p random radius values
    radii = rand(1, 1) * (2 - 1) + 1;
    radii = ones(1,p) * radii;
    for i = 1:p
        alpha = 0.3 + (0.6 - 0.3) * rand;
        radii(i) = radii(i) * alpha;
    end
    % Generete random domains
    randomDom = zeros(p, size);
    for i = 1:p
        randomPermutation = randperm(m); % Generate a random permutation of 1:m
        randomDom(i, :) = randomPermutation(1:size);
    end
end