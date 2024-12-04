function plotPoints(points, selectedPoints, save)
    figure;
    % Plot all points in black
    scatter(points(:, 1), points(:, 2), 'filled', 'MarkerFaceColor', [0.35 0.35 0.35], 'MarkerFaceAlpha', 0.25);
    hold on;
    % Plot the selected points in blue
    scatter(selectedPoints(:, 1), selectedPoints(:, 2), 250, 'r', 'x', 'LineWidth', 5);
    hold off;
    % Add labels and title
    %xlabel('X');
    %ylabel('Y');
    % Set axis limits
    xlim([-1, 11]);
    ylim([-1, 11]);
    % Display grid
    grid on;
    ax = gca; % Get current axis handle
    ax.XAxis.FontSize = 50; % Font size for x-axis tick labels
    ax.YAxis.FontSize = 50; % Font size for y-axis tick labels
    set(gcf, 'PaperPositionMode', 'auto'); % Ensure the paper position matches the figure position
    set(gcf, 'Position', [400, 400, 400, 400]); % Adjust size as needed
    % Add legend
    % legend('Random Points', 'Possible Locations', 'Location', 'best');
    if save
        disp('saving...')
        folder_path = "data/plots/";
        file_path = fullfile(folder_path, 'environment.svg');
        saveas(gcf, file_path);
        disp('saved!')
    end
end