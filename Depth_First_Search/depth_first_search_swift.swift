// Depth First Search in Swift

func dfs(_ graph: [Int: [Int]], start: Int) {
    var stack = [start]  // Create an empty stack and push the starting vertex
    var visited = Set<Int>()  // Create an empty set to track visited vertices

    while !stack.isEmpty {
        let vertex = stack.removeLast()  // Pop a vertex from the stack

        if !visited.contains(vertex) {  // If the vertex has not been visited
            visited.insert(vertex)  // Mark the vertex as visited
            processVertex(vertex)  // Process the vertex (e.g., print it, add it to a result list)

            // Push all unvisited neighbors of the vertex onto the stack
            if let neighbors = graph[vertex] {
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        stack.append(neighbor)
                    }
                }
            }
        }
    }
}


// Please note that the processVertex function is
// placeholder functions and need to be replaced with your specific logic to 
// handle the processing of each vertex.

// I hope this helps! Let me know if you need further assistance.
