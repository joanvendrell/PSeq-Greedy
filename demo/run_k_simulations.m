% Probabilistically run many simulations
function [realSelectedCenters,f_val] = run_k_simulations(p_success,sequence,n_trials,epochs,points,centers,randomDom,radii,k)
    f_val = zeros(epochs,1); realSelectedCenters = zeros(16,1);%zeros(length(centers),1);
    for epoch = 1:epochs
        communication = BinomialProcess(p_success,n_trials);
        [realSelectedCenters_idx, f_val_idx] = greedy_algorithm(points,centers,randomDom,radii,sequence,communication,k);
        f_val(epoch) = f_val_idx;
        %fprintf('Realcenter size is %d and the epoch %d \n',size(realSelectedCenters_idx,1),epoch)
        %fprintf('Sizes are:\n points %d\n centers %d\n randomDom %d\n radii %d\n sequence %d\n communication %d\n', size(points,1),size(centers,1),size(randomDom,1),size(radii,1),size(sequence,1),size(communication,1))
        realSelectedCenters = realSelectedCenters + realSelectedCenters_idx/epochs;
    end
    realSelectedCenters = round(realSelectedCenters);
end