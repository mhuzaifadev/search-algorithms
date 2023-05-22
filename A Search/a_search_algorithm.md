# **A * Search Algorithm**

    Input: Graph (adjacency list or matrix), start vertex, goal vertex, heuristic function
    Output: Optimal path from start to goal

    Create an empty priority queue and an empty set to track visited vertices.
    Enqueue the start vertex onto the priority queue with a priority of 0.
    While the priority queue is not empty:
        - Dequeue a vertex with the lowest priority from the priority queue.
        - If the vertex is the goal vertex, the optimal path has been found.
        - Mark the vertex as visited.
        - For each unvisited neighbor of the vertex:
            * Calculate the cost to reach the neighbor from the start vertex.
            * Enqueue the neighbor onto the priority queue with the calculated priority (cost + heuristic).
    Repeat steps 3-5 until the priority queue is empty or the goal vertex is reached.