// Depth First Search in C++

#include <iostream>
#include <vector>
#include <stack>
#include <unordered_set>
using namespace std;

void dfs(vector<vector<int>>& graph, int start) {
    stack<int> st;  // Create an empty stack and push the starting vertex
    unordered_set<int> visited;  // Create an empty set to track visited vertices

    st.push(start);

    while (!st.empty()) {
        int vertex = st.top();  // Pop a vertex from the stack
        st.pop();

        if (visited.find(vertex) == visited.end()) {  // If the vertex has not been visited
            visited.insert(vertex);  // Mark the vertex as visited
            processVertex(vertex);  // Process the vertex (e.g., print it, add it to a result list)

            // Push all unvisited neighbors of the vertex onto the stack
            for (int neighbor : graph[vertex]) {
                if (visited.find(neighbor) == visited.end()) {
                    st.push(neighbor);
                }
            }
        }
    }
}

// Please note that the processVertex function is
// placeholder functions and need to be replaced with your specific logic to 
// handle the processing of each vertex.

// I hope this helps! Let me know if you need further assistance.


