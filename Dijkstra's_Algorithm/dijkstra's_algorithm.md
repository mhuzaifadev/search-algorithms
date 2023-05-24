# ** Dijkstra`s Algorithm **

    Create a priority queue to store nodes with their distances.
    
    Initialize the distance of the start node to 0 and all other nodes to infinity.
    
    Add the start node to the priority queue.
    
    Repeat until the priority queue is empty:
    
        Remove the node with the minimum distance from the priority queue.
        
        If the removed node has already been visited, skip it.
        
        Mark the node as visited.
        
        Update the distances of its neighboring nodes if a shorter path is found.
        
        Add the neighboring nodes to the priority queue if their distances are updated.
    
    Return the distances of all nodes.