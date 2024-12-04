%
% Function to generate normal distributed random points
%
function normal_points = generateNormalRandomPoints(centers)
    normal_points = [];
    maxFocus = round(0.3*length(centers)); % achieve a more heterogeneous domain e.g. 4
    n = 0;
    shuffledIndices = randperm(length(centers));
    centers = centers(shuffledIndices,:);
    for i=1:length(centers)
        x0 = centers(i,1); y0 = centers(i,2);
        if n<maxFocus
            sigma_x = rand(1,1)*randi([1,8]); % e.g. 0.5
            sigma_y = rand(1,1)*randi([1,8]); % e.g. 0.5
            N = randi([80,100]);              % e.g. 250
            n = n + 1;
        else
            sigma_x = rand(1,1)*randi([10,20]); %e.g. 0.3
            sigma_y = rand(1,1)*randi([10,20]); %e.g. 0.3
            N = randi([5,20]);                  %e.g. 100
        end
        % Generate N points from a normal distribution
        x_points = x0 + sigma_x * randn(N, 1);
        y_points = y0 + sigma_y * randn(N, 1);
        points = [x_points,y_points];
        normal_points = [normal_points;points];
    end
end