clear
tic

%% Custom Parameter
numPlotPoint = 5;
T = 100;
finalT = 0.3;
declining_index = 0.96;

%% Initialization
A = readmatrix('dataform_train.csv');
%answer = randperm(90, numPlotPoint) - 21; %float-encoded
answer = [-17 5 14 38 67];

%% Annealing
cost = zeros(1,144);
cost(1) = ComputeFitness(answer, A);
count = 1;
while (T > finalT)
    idx = sort(randperm(size(A,2), 3));
    u = A(1, idx(1));
    v = A(1, idx(2));
    w = A(1, idx(3));
    numMoveRight = w - v;
    numMoveLeft = v - u + 1;
    newAnswer = answer;
    for i = 1:numPlotPoint 
        point = answer(i);
        if (point >= u && point <= v)
            newAnswer(i) = point + numMoveRight;
        elseif (point >= v + 1 && point <= w)
            newAnswer(i) = point - numMoveLeft;
        end
    end
    newCost = ComputeFitness(newAnswer, A);

    if (newCost < cost(count))
        answer = newAnswer;
        cost(count+1) = newCost;
    elseif (rand(1) < exp(-(newCost-cost(count))/T))
        answer = newAnswer;
        cost(count+1) = newCost; 
    else
        cost(count+1) = cost(count);
    end
    T = T * declining_index;
    count = count + 1;
end

%% Solution
plot(1:144,cost,'-o');
xlabel("times")
ylabel("cost")
solution.answer = answer;
solution.cost = cost(144);
solution
toc
