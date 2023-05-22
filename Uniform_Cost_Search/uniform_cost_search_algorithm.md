# **A * Search (DFS) Algorithm**

    Create an empty priority queue.
    
    Create an empty set to track visited nodes.
    
    Create a dictionary to track the cost to reach each node.
    
    Create a dictionary to track the previous node in the optimal path.
    
    Enqueue the initial node with a cost of 0.
    
    While the priority queue is not empty:
    
        - Dequeue a node with the lowest cost from the priority queue.
        - If the node is the goal node, the optimal path has been found. Break the loop.
        - If the node has not been visited:
            * Mark the node as visited.
            * For each neighbor of the node:
                Calculate the cost to reach the neighbor from the initial node.
                If the neighbor has not been assigned a cost or the new cost is lower than the current cost:
                    Update the cost to reach the neighbor.
                    Enqueue the neighbor into the priority queue with the new cost.
                    Track the previous node in the optimal path.
    Reconstruct the optimal path from the initial node to the goal node:
    
        - Start from the goal node.
        - Follow the previous node pointers until reaching the initial node.
        - Reverse the path to obtain the correct order.
    
    Return the optimal path.