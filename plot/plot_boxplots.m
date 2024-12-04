function plot_boxplots(L, varargin)
    % Number of input lists (excluding L)
    n = nargin - 1; % Adjust for the additional L input
    
    % Combine the data into a matrix
    data = cell2mat(cellfun(@(x) x(:), varargin, 'UniformOutput', false));
    
    % Create a figure
    figure;
    
    % Plot box plots on the primary y-axis
    yyaxis left; % Activate the left y-axis
    h=boxplot(data, 'whisker', Inf, 'Labels', arrayfun(@(x) ['P' num2str(x)], 1:n, 'UniformOutput', false));
    set(h, 'LineWidth', 2);
    
    % Add label for the primary y-axis
    ax = gca; % Get current axis
    ax.YColor = 'black';
    ax.FontSize = 50; % Font size for y-axis tick labels
    ylabel('Coverage', 'Color', 'black');%,'FontSize', 25);
    hold on;
    
    % Calculate and plot the mean for each dataset
    for i = 1:n
        mean_val = mean(varargin{i}); % Calculate mean of the i-th dataset
        plot(i, mean_val, 'r*', 'MarkerSize', 10); % Plot mean as a red asterisk
    end
    
    % Create a new y-axis on the right for the scatter plot
    yyaxis right; % Activate the secondary y-axis
    
    % Plot the scatter plot for L on the secondary y-axis
    scatter(1:numel(L), L, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');
    
    % Add label for the secondary y-axis
    ax = gca; % Get current axis
    ax.FontSize = 50; % Font size for x-axis tick labels
    ax.YColor = 'blue';
    ylabel('Optimality Gap', 'Color', 'blue');%,'FontSize', 25);
    
    % Add x-axis label and title
    xlabel('Agent Reinforced');%,'FontSize', 25);
    
    % Add grid
    grid on;
    hold off;
end