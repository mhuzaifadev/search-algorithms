# **Iterative Deepening DFS (IDDFS) Algorithm**

**Input:**

    graph: a graph represented as an adjacency list
    start: the starting node
    target: the target node
    maxDepth: the maximum depth to explore

**Output:**

    Returns true if a path from start to target exists within the specified maximum depth, and false otherwise.

**Pseudocode:**

    function IDDFS(graph, start, target, maxDepth):
        for depth in range(0, maxDepth+1):
            visited = empty set
            if DLS(graph, start, target, depth, visited):
                return true
        return false

    function DLS(graph, node, target, depth, visited):
        if depth == 0 and node == target:
            return true
        if depth > 0:
            visited.add(node)
            for neighbor in graph[node]:
                if neighbor not in visited:
                    if DLS(graph, neighbor, target, depth-1, visited):
                        return true
        return false
