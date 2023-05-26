# Iterative Deepening DFS Algorithm in Python

def iddfs(graph, start, target, max_depth):
    for depth in range(max_depth+1):
        visited = set()
        if dls(graph, start, target, depth, visited):
            return True
    return False

def dls(graph, node, target, depth, visited):
    if depth == 0 and node == target:
        return True
    if depth > 0:
        visited.add(node)
        for neighbor in graph[node]:
            if neighbor not in visited:
                if dls(graph, neighbor, target, depth-1, visited):
                    return True
    return False

# Example usage
graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': []
}

start = 'A'
target = 'F'
max_depth = 3

if iddfs(graph, start, target, max_depth):
    print("Path exists")
else:
    print("Path does not exist")
