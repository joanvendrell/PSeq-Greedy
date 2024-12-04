function plot_points_with_circles(N_points, C_points, k_indices, k_radius, k, file_name, save)
    figure;
    % Plot N points in black
    scatter(N_points(:, 1), N_points(:, 2), 'filled', 'MarkerFaceColor', [0.35 0.35 0.35], 'MarkerFaceAlpha', 0.25);
    hold on;
    % Plot C points in blue
    scatter(C_points(:,1), C_points(:,2), 250, 'r', 'x', 'LineWidth', 5);
    % Plot C points corresponding to k_indices as crosses in k different colors
    colors = jet(length(k_radius));
    idx = 1:length(k_indices);
    n=1;
    for i = idx(1:k:end)
        for j = i:i+k-1
            scatter(C_points(k_indices(j), 1), C_points(k_indices(j), 2), 100, '+', 'MarkerEdgeColor', colors(n, :));
        end
        n=n+1;
    end
    % Plot translucent circles with corresponding radii
    n=1;
    for i = idx(1:k:end)
        for j = i:i+k-1
            theta = linspace(0, 2*pi, 100);
            x_circle = C_points(k_indices(j), 1) + k_radius(n) * cos(theta);
            y_circle = C_points(k_indices(j), 2) + k_radius(n) * sin(theta);
            patch(x_circle, y_circle, colors(n, :), 'FaceAlpha', 0.2, 'EdgeColor', 'none');
        end
        n=n+1;
    end    
    %axis equal;
    %xlabel('X','FontSize', 25);
    %ylabel('Y','FontSize', 25);
    % Set axis limits
    xlim([-1, 11]);
    ylim([-1, 11]);
    % Display grid
    grid on;
    % Adjust font size of tick labels
    ax = gca; % Get current axis handle
    ax.XAxis.FontSize = 50; % Font size for x-axis tick labels
    ax.YAxis.FontSize = 50; % Font size for y-axis tick labels
    %title('Coverage');
    %legend('N Points', 'Ground Set', 'Greedy Selection', 'Coverage');
    if save
        disp('saving...')
        folder_path = "data/plots/";
        file_path = fullfile(folder_path, file_name);
        saveas(gcf, file_path);
        disp('saved!')
        hold off;
    end
end