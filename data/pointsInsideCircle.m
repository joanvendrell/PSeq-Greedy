% Function to compute the number of points inside the circles of an agent
% from one point

function [numInsideCircle, pointsInside] = pointsInsideCircle(N, k, radius)
    % Calculate distances between each point in N and the center point k
    distances = sqrt((N(:, 1) - k(1)).^2 + (N(:, 2) - k(2)).^2);
    
    % Find points inside the circle
    insideIndices = distances <= radius;
    pointsInside = N(insideIndices, :);
    
    % Count the number of points inside the circle
    numInsideCircle = sum(insideIndices);
end