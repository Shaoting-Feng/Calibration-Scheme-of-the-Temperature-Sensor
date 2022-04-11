# Calibration-Scheme-of-the-Temperature-Sensor
This respository takes a certain temperature sensor as the research object, and uses statistical methods to explore the calibration scheme of the temperature sensor with nonlinear relationship between input and output. Since there are many point-selecting schemes, the time complexity of the exhaustive method is too high, so the heuristic search scheme is adopted. Genetic algorithm is a heuristic search method that imitates the natural genetic mechanism. It has high efficiency in solving such problems and can obtain an approximate solution of an optimal solution. In this paper, the genetic algorithm is used as the optimization algorithm, and the simulated annealing algorithm is used as an extension. The cubic spline interpolation method is used to find the optimal solution.

-- How to use this respository?
-- If you want to have a satisfying solution in reasonable time, you can:
   1) Use the Genetic Algorithm. Set numIndividuals = 200，numGeneration = 20，mutationRate = 0.1. You can get a solution cost less than 400$ with a possibility of 0.6 in 80 seconds. You may get a relatively optimal solution picking 5 points cost about 360$ in this way.
   2) Use the Annealing Simulation Algorithm. And specify picking 6 points. You can get a solution cost around 380$ in less than 5$. But you cannot get the optimal solution.
   3) First use the Genetic Algorithm and set the parameters as above. Than use the solution as the initial answer in the Annelaing Simulation Algorithm. It is recommended. 
