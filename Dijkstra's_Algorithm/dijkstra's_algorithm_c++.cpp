// Dijkstra`s Algorithm in C++

#include <iostream>
#include <queue>
#include <vector>
#include <limits>

using namespace std;

vector<int> dijkstra(const vector<vector<pair<int, int>>>& graph, int start) {
    int n = graph.size();
    vector<int> distances(n, numeric_limits<int>::max());
    distances[start] = 0;
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    pq.emplace(0, start);

    while (!pq.empty()) {
        int currentDistance = pq.top().first;
        int currentNode = pq.top().second;
        pq.pop();

        if (currentDistance > distances[currentNode]) {
            continue;
        }

        for (const auto& neighbor : graph[currentNode]) {
            int neighborNode = neighbor.first;
            int weight = neighbor.second;
            int distance = currentDistance + weight;

            if (distance < distances[neighborNode]) {
                distances[neighborNode] = distance;
                pq.emplace(distance, neighborNode);
            }
        }
    }

    return distances;
}

int main() {
    int n = 4;
    vector<vector<pair<int, int>>> graph(n);
    graph[0] = {{1, 4}, {2, 1}};
    graph[1] = {{3, 1}};
    graph[2] = {{1, 2}, {3, 5}};
    graph[3] = {};

    vector<int> distances = dijkstra(graph, 0);

    for (int i = 0; i < n; ++i) {
        cout << "Distance from 0 to " << i << " : " << distances[i] << endl;
    }

    return 0;
}

