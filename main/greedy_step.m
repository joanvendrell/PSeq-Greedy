%
% Function for greedy decision given a set of marginal gains
% 
function [selectedPoints, selectedCenters, f_val] = greedy_step(points,centers,randomDom,radii,selectedCenters,selectedPoints)
    % correct the domian
    if isempty(selectedPoints)
        remainingPoints = points;
    else
        remainingPoints = setdiff(points, selectedPoints, 'rows');
    end
    % correct the ground set
    if isempty(selectedCenters)
        remainingCenters = 1:numel(centers);
    else
        remainingCenters = setdiff(1:numel(centers), selectedCenters);
    end
    % iterate to find the maximum
    maxPointsInside=[]; maxNumInsideCircle=0; maxCenter=0;
    available_domain = intersect(randomDom,remainingCenters);
    if isempty(available_domain)
        f_val = 0;
        selectedCenters = [];
        selectedPoints = [];
        return
    end
    for j=1:length(available_domain)
        center = available_domain(j);
        [numInsideCircle, pointsInside] = pointsInsideCircle(remainingPoints, centers(center,:), radii);
        if numInsideCircle>=maxNumInsideCircle
           maxPointsInside=pointsInside;
           maxNumInsideCircle=numInsideCircle;
           maxCenter = center;
        end
    end
    selectedPoints = maxPointsInside;
    selectedCenters = maxCenter;
    f_val = maxNumInsideCircle;
end