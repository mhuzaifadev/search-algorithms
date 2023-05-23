# Uniform Cost Search in Python

import heapq

def dijkstra(graph, start):
    # Initialize distances with infinity except for the start node
    distances = {node: float('inf') for node in graph}
    distances[start] = 0

    # Priority queue to store nodes with their minimum distances
    priority_queue = [(0, start)]

    while priority_queue:
        current_distance, current_node = heapq.heappop(priority_queue)

        # Skip if the current node has already been visited
        if current_distance > distances[current_node]:
            continue

        # Explore neighbors of the current node
        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight

            # Update distance if a shorter path is found
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(priority_queue, (distance, neighbor))

    return distances
