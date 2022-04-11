function cost = ComputeFitness(answer, A)
    numDevice = 0.5 * size(A, 1);
    numPlotPoint = size(answer, 2);
    singleCost = zeros(numDevice, 1);
    for device = 1:numDevice
        idx = answer + 21;
        x = A(2*device, idx);
        y = A(2*device-1, idx);
        result = interp1(x ,y, A(2*device, :), 'spline');
        error = abs(result - A(2*device-1, :));
        step05 = sum(error <= 0.5);
        step1 = sum(error <= 1);
        step15 = sum(error <= 1.5);
        step2 = sum(error <= 2);
        step3 = sum(error > 2);
        singleCost(device) = (step1-step05)*1 + (step15-step1)*8 + (step2-step15)*30 + step3*20000;
    end
    cost = sum(singleCost) / numDevice + 60 * numPlotPoint;
end 