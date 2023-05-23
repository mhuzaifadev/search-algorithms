// Uniform Cost Search in C++

#include <iostream>
#include <queue>
#include <vector>
#include <unordered_map>
#include <limits>

using namespace std;

class Node {
public:
    int vertex;
    int distance;

    Node(int v, int d) : vertex(v), distance(d) {}

    bool operator>(const Node& other) const {
        return distance > other.distance;
    }
};

unordered_map<int, int> dijkstra(unordered_map<int, unordered_map<int, int>>& graph, int start) {
    unordered_map<int, int> distances;
    priority_queue<Node, vector<Node>, greater<Node>> pq;

    for (const auto& pair : graph) {
        distances[pair.first] = numeric_limits<int>::max();
    }
    distances[start] = 0;

    pq.emplace(start, 0);

    while (!pq.empty()) {
        Node current = pq.top();
        pq.pop();

        if (current.distance > distances[current.vertex]) {
            continue;
        }

        for (const auto& neighbor : graph[current.vertex]) {
            int neighborVertex = neighbor.first;
            int weight = neighbor.second;
            int distance = current.distance + weight;

            if (distance < distances[neighborVertex]) {
                distances[neighborVertex] = distance;
                pq.emplace(neighborVertex, distance);
            }
        }
    }

    return distances;
}

int main() {
    unordered_map<int, unordered_map<int, int>> graph;
    graph[0] = {{1, 4}, {2, 1}};
    graph[1] = {{3, 1}};
    graph[2] = {{1, 2}, {3, 5}};
    graph[3] = {};

    unordered_map<int, int> distances = dijkstra(graph, 0);

    for (const auto& pair : distances) {
        cout << "Distance from 0 to " << pair.first << " : " << pair.second << endl;
    }

    return 0;
}
