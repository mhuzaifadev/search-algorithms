// Breadth First Search in Swift

func bfs(_ graph: [Int: [Int]], start: Int) {
    var queue = [start]  // Create an empty queue and enqueue the starting vertex
    var visited = Set<Int>()  // Create an empty set to track visited vertices

    while !queue.isEmpty {
        let vertex = queue.removeFirst()  // Dequeue a vertex from the queue

        if !visited.contains(vertex) {  // If the vertex has not been visited
            visited.insert(vertex)  // Mark the vertex as visited
            processVertex(vertex)  // Process the vertex (e.g., print it, add it to a result list)

            // Enqueue all unvisited neighbors of the vertex
            if let neighbors = graph[vertex] {
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        queue.append(neighbor)
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
