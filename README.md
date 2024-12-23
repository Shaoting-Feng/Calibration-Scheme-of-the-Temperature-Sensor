# Calibration Scheme of the Temperature Sensor

This repository explores the calibration scheme of a temperature sensor with a nonlinear relationship between input and output. By leveraging statistical methods, we aim to optimize the calibration process using heuristic search algorithms.

## Overview

The calibration of temperature sensors can be complex due to the nonlinear relationship between input and output. Traditional exhaustive methods are time-consuming and computationally expensive. This project adopts heuristic search methods, specifically genetic algorithms and simulated annealing, to find optimal calibration points efficiently.

## Algorithms Used

### Genetic Algorithm
- **Description**: A heuristic search method that mimics natural genetic mechanisms.
- **Parameters**:
  - `numIndividuals = 200`
  - `numGeneration = 20`
  - `mutationRate = 0.1`
- **Performance**: Achieves a solution costing less than $400 with a 60% probability in 80 seconds.

### Simulated Annealing Algorithm
- **Description**: An optimization technique used as an extension to the genetic algorithm.
- **Performance**: Provides a solution costing around $380 when picking 6 points, though it may not always find the optimal solution.

## Recommended Approach

1. **Initial Calibration**: Use the Genetic Algorithm with the specified parameters.
2. **Optimization**: Use the solution from the Genetic Algorithm as the initial input for the Simulated Annealing Algorithm to refine the results.

## How to Use

1. **Genetic Algorithm**:
   - Set the parameters as described above.
   - Run the algorithm to get an initial solution.

2. **Simulated Annealing**:
   - Use the initial solution from the Genetic Algorithm.
   - Run the algorithm to further optimize the calibration points.

## License

This project is licensed under the Apache-2.0 License.
