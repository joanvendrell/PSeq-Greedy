%
% Function to choose random m points from a set of points
%
%% Select m random points from the given set of points
function selectedPoints = chooseRandomPoints(points, m)
    % indices = randperm(size(points, 1), m); % Randomly permute the indices
    % selectedPoints = points(indices, :); % Select the corresponding points
    selectedPoints = select_sparse_points(points, m, round(sqrt(m)));
end

%% Select m random points from the given set of points
function selected_points = select_sparse_points(points, N, grid_size)
    % Points is an Mx2 matrix where each row represents a 2D point (x, y)
    % N is the number of points to select
    % grid_size is the number of grid cells along each axis

    % Get the min and max coordinates
    x_min = min(points(:, 1));
    x_max = max(points(:, 1));
    y_min = min(points(:, 2));
    y_max = max(points(:, 2));

    % Calculate grid cell size
    x_grid_size = (x_max - x_min) / grid_size;
    y_grid_size = (y_max - y_min) / grid_size;

    % Create a cell array to store points in each grid cell
    grid = cell(grid_size, grid_size);

    % Assign points to grid cells
    for i = 1:size(points, 1)
        grid_x = max(1, min(grid_size, ceil((points(i, 1) - x_min) / x_grid_size)));
        grid_y = max(1, min(grid_size, ceil((points(i, 2) - y_min) / y_grid_size)));
        grid{grid_x, grid_y} = [grid{grid_x, grid_y}; points(i, :)];
    end

    % Initialize the array for selected points
    selected_points = [];

    % Randomly select one point from each non-empty grid cell
    for i = 1:grid_size
        for j = 1:grid_size
            if ~isempty(grid{i, j})
                selected_points = [selected_points; grid{i, j}(randi(size(grid{i, j}, 1)), :)];
                if size(selected_points, 1) >= N
                    selected_points = selected_points(1:N, :);
                    return;
                end
            end
        end
    end

    % If fewer than N points are selected, randomly select additional points
    while size(selected_points, 1) < N
        remaining_points = N - size(selected_points, 1);
        random_indices = randperm(size(selected_points, 1), remaining_points);
        selected_points = [selected_points; selected_points(random_indices, :)];
    end

    % Trim the list to exactly N points
    selected_points = selected_points(1:N, :);
end