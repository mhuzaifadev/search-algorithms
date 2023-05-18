//Depth First Search in C# (C Sharp)

using System;
using System.Collections.Generic;

public class DepthFirstSearch {
    public static void Dfs(Dictionary<int, List<int>> graph, int start) {
        Stack<int> stack = new Stack<int>();  // Create an empty stack and push the starting vertex
        HashSet<int> visited = new HashSet<int>();  // Create an empty set to track visited vertices

        stack.Push(start);

        while (stack.Count > 0) {
            int vertex = stack.Pop();  // Pop a vertex from the stack

            if (!visited.Contains(vertex)) {  // If the vertex has not been visited
                visited.Add(vertex);  // Mark the vertex as visited
                ProcessVertex(vertex);  // Process the vertex (e.g., print it, add it to a result list)

                // Push all unvisited neighbors of the vertex onto the stack
                foreach (int neighbor in graph[vertex]) {
                    if (!visited.Contains(neighbor)) {
                        stack.Push(neighbor);
                    }
                }
            }
        }
    }
}


// Please note that the ProcessVertex function is
// placeholder functions and need to be replaced with your specific logic to 
// handle the processing of each vertex.

// I hope this helps! Let me know if you need further assistance.