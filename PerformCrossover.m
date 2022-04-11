function individuals = PerformCrossover(individuals, idxIndividual)
    for n = 1:(numel(idxIndividual)/2)
        idxA = idxIndividual(2 * n - 1);                                       
        idxB = idxIndividual(2 * n); 
        AA = individuals(idxA, :);
        B = individuals(idxB, :);
        AAA = (1:90) .* AA;
        BBB = (1:90) .* B;
        iA = nonzeros(AAA); 
        iB = nonzeros(BBB);
        divA = iA(floor(sum(AA)/2) + 1);
        divB = iB(floor(sum(B)/2)) + 1);
        individuals(2 * n - 1, :) = [AA(1:divA) B(divA+1:end)];
        individuals(2 * n, :) = [B(1:divB) AA(divB+1:end)];
    end
end 