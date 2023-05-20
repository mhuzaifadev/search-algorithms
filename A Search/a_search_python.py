# A* Search in Python

import heapq

def astar(graph, start, goal, heuristic):
    priority_queue = [(0, start)]  # Create an empty priority queue and enqueue the start vertex
    visited = set()  # Create an empty set to track visited vertices
    cost_so_far = {start: 0}  # Create a dictionary to track the cost to reach each vertex

    while priority_queue:
        _, vertex = heapq.heappop(priority_queue)  # Dequeue a vertex with the lowest priority from the priority queue

        if vertex == goal:  # If the vertex is the goal vertex, the optimal path has been found
            break

        if vertex not in visited:  # If the vertex has not been visited
            visited.add(vertex)  # Mark the vertex as visited

            for neighbor in graph[vertex]:
                new_cost = cost_so_far[vertex] + graph[vertex][neighbor]  # Calculate the cost to reach the neighbor from the start vertex

                if neighbor not in cost_so_far or new_cost < cost_so_far[neighbor]:
                    cost_so_far[neighbor] = new_cost
                    priority = new_cost + heuristic(neighbor, goal)  # Calculate the priority (cost + heuristic)
                    heapq.heappush(priority_queue, (priority, neighbor))  # Enqueue the neighbor onto the priority queue with the calculated priority

    return reconstruct_path(start, goal, cost_so_far)  # Return the optimal path

def reconstruct_path(start, goal, cost_so_far):
    path = [goal]
    current = goal

    while current != start:
        neighbors = cost_so_far[current]
        next_node = min(neighbors, key=lambda x: cost_so_far[x])
        path.append(next_node)
        current = next_node

    path.reverse()
    return path



