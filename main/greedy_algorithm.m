%
% Greedy algorithm implementation for agents deployment
%
function [realSelectedCenters, f_val] = greedy_algorithm(points,centers,randomDom,radii,sequence,communication,k)
    realSelectedCenters=[];realSelectedPoints=[];         %Real situation
    observedSelectedCenters=[];observedSelectedPoints=[]; %Situation perceived by the agents due to communication
    f_val = 0;
    for i=1:length(sequence)
        agent=sequence(i);
        % define communication --- 1:gets information, 0:it doesn't
        if ~communication(agent)
            observedSelectedCenters=[];
            observedSelectedPoints=[];
        end
        % apply greedy_step k times (cardinality constraints)
        for j=1:k
            [selectedPoints_i, selectedCenters_i,~] = greedy_step(points,centers,randomDom(agent,:),radii(agent),observedSelectedCenters,observedSelectedPoints);
            if isempty(selectedCenters_i)
                continue;
            end
            % compute the real f_val_i
            if isempty(realSelectedPoints)
                remainingPoints = points;
            else
                remainingPoints = setdiff(points, realSelectedPoints, 'rows');
            end
            [f_val_i,~] = pointsInsideCircle(remainingPoints, centers(selectedCenters_i,:), radii(agent));
            % merge solutions
            f_val = f_val + f_val_i;
            realSelectedCenters=[realSelectedCenters;selectedCenters_i];
            realSelectedPoints=[realSelectedPoints;selectedPoints_i];
            observedSelectedCenters=[observedSelectedCenters;selectedCenters_i];
            observedSelectedPoints=[observedSelectedPoints;selectedPoints_i];
        end
    end
end