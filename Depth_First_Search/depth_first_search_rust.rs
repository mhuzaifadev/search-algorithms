// Depth First Search in Rust

use std::collections::{HashSet, VecDeque};

fn dfs(graph: &Vec<Vec<usize>>, start: usize) {
    let mut stack = VecDeque::new();  // Create an empty stack and push the starting vertex
    let mut visited = HashSet::new();  // Create an empty set to track visited vertices

    stack.push_back(start);

    while let Some(vertex) = stack.pop_back() {
        if !visited.contains(&vertex) {  // If the vertex has not been visited
            visited.insert(vertex);  // Mark the vertex as visited
            process_vertex(vertex);  // Process the vertex (e.g., print it, add it to a result list)

            // Push all unvisited neighbors of the vertex onto the stack
            for &neighbor in &graph[vertex] {
                if !visited.contains(&neighbor) {
                    stack.push_back(neighbor);
                }
            }
        }
    }
}


// Please note that the process_vertex function is
// placeholder functions and need to be replaced with your specific logic to 
// handle the processing of each vertex.

// I hope this helps! Let me know if you need further assistance.
