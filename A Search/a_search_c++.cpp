// Breadth First Search in C++

#include <iostream>
#include <vector>
#include <queue>
#include <unordered_set>
#include <unordered_map>
#include <functional>
using namespace std;

typedef pair<int, int> pii;
typedef pair<int, pii> pipii;

vector<int> astar(vector<unordered_map<int, int>>& graph, int start, int goal, function<int(int, int)> heuristic) {
    priority_queue<pipii, vector<pipii>, greater<pipii>> priorityQueue;  // Create an empty priority queue
    unordered_set<int> visited;  // Create an empty set to track visited vertices
    unordered_map<int, int> costSoFar;  // Create a map to track the cost to reach each vertex
    unordered_map<int, int> cameFrom;  // Create a map to track the previous vertex in the optimal path

    priorityQueue.push(make_pair(0, make_pair(start, start)));  // Enqueue the start vertex with a priority of 0

    while (!priorityQueue.empty()) {
        pipii node = priorityQueue.top();  // Dequeue a vertex with the lowest priority from the priority queue
        priorityQueue.pop();
        int vertex = node.second.first;

        if (vertex == goal) {  // If the vertex is the goal vertex, the optimal path has been found
            break;
        }

        if (visited.find(vertex) == visited.end()) {  // If the vertex has not been visited
            visited.insert(vertex);  // Mark the vertex as visited

            for (auto neighbor : graph[vertex]) {
                int cost = costSoFar[vertex] + neighbor.second;  // Calculate the cost to reach the neighbor from the start vertex

                if (costSoFar.find(neighbor.first) == costSoFar.end() || cost < costSoFar[neighbor.first]) {
                    costSoFar[neighbor.first] = cost;
                    int priority = cost + heuristic(neighbor.first, goal);  // Calculate the priority (cost + heuristic)
                    priorityQueue.push(make_pair(priority, make_pair(neighbor.first, vertex)));  // Enqueue the neighbor onto the priority queue with the calculated priority
                    cameFrom[neighbor.first] = vertex;  // Track the previous vertex in the optimal path
                }
            }
        }
    }

    return reconstructPath(start, goal, cameFrom);  // Return the optimal path
}

vector<int> reconstructPath(int start, int goal, unordered_map<int, int>& cameFrom) {
    vector<int> path;
    int current = goal;

    while (current != start) {
        path.push_back(current);
        current = cameFrom[current];
    }

    path.push_back(start);
    reverse(path.begin(), path.end());
    return path;
}

