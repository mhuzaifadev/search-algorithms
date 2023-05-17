# Search Algorithms Repository

This repository contains implementations of various search algorithms in different programming languages. The algorithms are designed to solve different types of search problems efficiently. Each algorithm is implemented in multiple languages, including **Python3**, **Java**, **C++**, **C#**, **R**, **Swift**, **JavaScript**, and **Rust**, to make it easy for developers to understand and use them in their projects.

## Algorithms

| Algorithm                         | Description                                                                                                           | Big O     |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------|-----------|
| **Linear Search**                     | A simple search algorithm that sequentially checks each element in a list until a match is found.                      | O(n)      |
| **Binary Search**                     | An efficient algorithm that divides a sorted list into two halves and narrows down the search range by comparing values.| O(log n)  |
| **Depth-First Search (DFS)**           | A graph traversal algorithm that explores as far as possible along each branch before backtracking.                    | O(V + E)  |
| **Breadth-First Search (BFS)**         | Another graph traversal algorithm that explores all vertices at the same depth level before moving to the next level.  | O(V + E)  |
| **A* Search**                         | An informed search algorithm that uses heuristics to efficiently search for a path between nodes in a graph.           | O(b^d)    |
| **Uniform-Cost Search (UCS)**          | A graph search algorithm that explores the least-cost path by assigning a cost to each edge.                           | O((V + E) log V) |
| **Dijkstra's Algorithm**              | A popular algorithm for finding the shortest path between nodes in a graph with non-negative edge weights.             | O((V + E) log V) |
| **Iterative Deepening DFS (IDDFS)**    | A combination of depth-first search and breadth-first search that gradually increases the depth limit until the goal is found. | O(b^d) |
| **Bidirectional Search**              | An algorithm that runs two simultaneous searches, one forward and one backward, until they meet.                      | O(b^(d/2)) |
| **Jump Search**                       | A search algorithm that works on sorted arrays by making fixed steps and performing linear search in the bounded range. | O(sqrt(n)) |
| **Interpolation Search**              | A search algorithm that uses numerical estimates to find an appropriate position to search in a sorted array.           | O(log log n) |
| **Exponential Search**                | An algorithm that exponentially increases the search range until a range containing the target element is found.        | O(log n)  |
| **Red-Black Tree**                    | A self-balancing binary search tree that maintains balance during insertions and deletions.                            | O(log n)  |
| **Trie (Prefix Tree)**                | A tree-based data structure used for efficient searching and prefix-based operations.                                  | O(m)      |
| **Hashing**                           | A technique that maps data elements to a fixed-size array using a hash function.                                       | O(1)      |
| **Simulated Annealing**               | A probabilistic search algorithm inspired by annealing in metallurgy.                                                  | Depends on the problem |
| **Genetic Algorithms**                | Search algorithms inspired by the process of natural selection.                                                         | Depends on the problem |
| **Ant Colony Optimization**           | An optimization algorithm that models the behavior of ant colonies in nature.                                          | Depends on the problem |
| **Particle Swarm Optimization**       | An optimization algorithm inspired by the collective behavior of swarms.                                               | Depends on the problem |
| **Tabu Search**                       | A metaheuristic search algorithm that uses memory structures to escape local optima and explore the search space more effectively. | Depends on the problem |


## Usage

Each algorithm is implemented in multiple programming languages within the repository. To use a specific algorithm, navigate to the corresponding directory in the repository and select the language of your choice. Each implementation comes with a detailed explanation and usage instructions in its respective README file.

## Contribution

Contributions to the repository are welcome! If you have an algorithm implementation in a programming language that is not currently included or you would like to improve an existing implementation, feel free to open a pull request.

Please ensure that your code follows the repository's coding guidelines and includes appropriate documentation and test cases.

## License

The search algorithms in this repository are available under the [Apache 2.0 License](LICENSE). Feel free to use and modify the code.
