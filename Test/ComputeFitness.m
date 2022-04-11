function [fitness, idxFitness] = ComputeFitness(individuals, A)
    numDevice = 0.5 * size(A, 1);
    numPoint = size(A, 2);
    numIndividual = size(individuals, 1);
    cost = zeros(numIndividual, 1);
    for individual = 1:numIndividual
        numPlotPoint = sum(individuals(individual, :));
        if numPlotPoint < 2
            cost(individual) = 10000;
        else
            singleCost = zeros(numDevice, 1);
            for device = 1:numDevice
                idx = individuals(individual, :) == 1;
                x = A(2*device, idx);
                y = A(2*device-1, idx);
                result = interp1(x ,y, A(2*device, :), 'spline');
                error = abs(result - A(2*device-1, :));
                step05 = sum(error<=0.5);
                step1 = sum(error<=1);
                step15 = sum(error<=1.5);
                step2 = sum(error<=2);
                step3 = sum(error>2);
                singleCost(device) = (step1-step05)*1 + (step15-step1)*8 + (step2-step15)*30 + step3*20000;
            end
            cost(individual) = sum(singleCost)/numDevice + 60*numPlotPoint;
        end
    end
    fitness = 1 ./ cost;
    %fitness = cost;
    [~, idxFitness] = sort(fitness,'descend');
end 