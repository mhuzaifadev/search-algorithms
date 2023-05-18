# **Depth-First Search (DFS) Algorithm**

    Input: Graph (adjacency list or matrix), starting vertex
    Output: Visited vertices in DFS order

    Create an empty stack and an empty set to track visited vertices.
    
    Push the starting vertex onto the stack.
    
    While the stack is not empty:
        - Pop a vertex from the stack.

        - If the vertex has not been visited: 
            * Mark the vertex as visited.
            * Process the vertex (e.g., print it, add it to a result list).
            * Push all unvisited neighbors of the vertex onto the stack.

    Repeat steps 3-4 until the stack is empty.