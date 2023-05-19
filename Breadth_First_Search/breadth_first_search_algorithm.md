# **Breadth-First Search (DFS) Algorithm**

    Input: Graph (adjacency list or matrix), starting vertex
    Output: Visited vertices in BFS order

    Create an empty queue and an empty set to track visited vertices.
    
    Enqueue the starting vertex onto the queue.
    
    While the queue is not empty:
    - Dequeue a vertex from the queue.
    - If the vertex has not been visited:
        * Mark the vertex as visited.
        * Process the vertex (e.g., print it, add it to a result list).
        * Enqueue all unvisited neighbors of the vertex.
    Repeat steps 3-4 until the queue is empty.