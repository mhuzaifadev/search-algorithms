# A* Search in Python

import heapq

def ucs(graph, start, goal):
    priority_queue = [(0, start)]
    visited = set()
    cost_so_far = {start: 0}
    came_from = {}

    while priority_queue:
        _, node = heapq.heappop(priority_queue)

        if node == goal:
            break

        if node not in visited:
            visited.add(node)

            for neighbor, cost in graph[node].items():
                new_cost = cost_so_far[node] + cost

                if neighbor not in cost_so_far or new_cost < cost_so_far[neighbor]:
                    cost_so_far[neighbor] = new_cost
                    heapq.heappush(priority_queue, (new_cost, neighbor))
                    came_from[neighbor] = node

    return reconstruct_path(start, goal, came_from)

def reconstruct_path(start, goal, came_from):
    path = []
    current = goal

    while current != start:
        path.append(current)
        current = came_from[current]

    path.append(start)
    path.reverse()
    return path
