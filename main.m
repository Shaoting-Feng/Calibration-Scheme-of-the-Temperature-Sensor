clear
tic

%% Custom Parameter
maxNumGenerations = 20;
numIndividuals = 200;
mutationRate = 0.2;
initRate  = 0.05;
cullRate = 1;

%% Initialization
A=readmatrix('dataform_train.csv');
numGen = 0;
numDevice = 0.5 * size(A, 1);
numPoint = size(A, 2);
individuals = rand(numIndividuals, numPoint) < initRate;   
numBest = floor(cullRate * numIndividuals);
y = zeros(1,maxNumGenerations);

%% Reproduce
while (numGen < maxNumGenerations)                                         
    % Compute fitness
    [fitness, idxFitness] = ComputeFitness(individuals, A); 
    
    % Cull
    individuals = individuals(idxFitness(1:numBest), :);                            
    totalFitness = sum(fitness(idxFitness(1:numBest)));                   
    probabilities = fitness(idxFitness(1:numBest)) / totalFitness;
    
    % Clone
    king = individuals(1, :);
    
    % Select alive individuals    
    trials = rand(numIndividuals,1);        
    sumP = cumsum(probabilities);                                  
    SelectIndividuals = @(r) find(r < sumP, 1, 'first'); 
    idxIndividual = arrayfun(SelectIndividuals, trials);                          
    idxCrossoverLocation = randi([1, numPoint-1], numIndividuals / 2, 1);     
    
    % Crossover
    individuals = PerformCrossover2(individuals, idxIndividual, idxCrossoverLocation);
    
    % Mutate
    mutationMap = rand(numIndividuals, numPoint) < mutationRate; 
    individuals(mutationMap==1) = 0;

    individuals(1, :) = king;
    
    numGen = numGen + 1;  
    y(numGen) = 1/fitness(idxFitness(1));
end 

%% Solution
[fitness, idxFitness] = ComputeFitness(individuals, A);         
solution.individual = individuals(idxFitness(1),:);
solution.cost = 1/fitness(idxFitness(1));
plot(1:20,y,'-o');
solution
toc

