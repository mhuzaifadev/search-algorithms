// A* Search in C++

#include <queue>
#include <unordered_map>
#include <vector>

struct Node {
    int vertex;
    int cost;

    Node(int vertex, int cost) : vertex(vertex), cost(cost) {}

    bool operator<(const Node& other) const {
        return cost > other.cost;
    }
};

std::vector<int> ucs(const std::unordered_map<int, std::unordered_map<int, int>>& graph, int start, int goal) {
    std::priority_queue<Node> priorityQueue;
    std::unordered_map<int, int> costSoFar;
    std::unordered_map<int, int> cameFrom;

    priorityQueue.emplace(start, 0);
    costSoFar[start] = 0;

    while (!priorityQueue.empty()) {
        Node node = priorityQueue.top();
        priorityQueue.pop();
        int vertex = node.vertex;

        if (vertex == goal) {
            break;
        }

        for (const auto& neighbor : graph.at(vertex)) {
            int neighborVertex = neighbor.first;
            int cost = neighbor.second;
            int newCost = costSoFar[vertex] + cost;

            if (!costSoFar.count(neighborVertex) || newCost < costSoFar[neighborVertex]) {
                costSoFar[neighborVertex] = newCost;
                priorityQueue.emplace(neighborVertex, newCost);
                cameFrom[neighborVertex] = vertex;
            }
        }
    }

    return reconstructPath(start, goal, cameFrom);
}

std::vector<int> reconstructPath(int start, int goal, const std::unordered_map<int, int>& cameFrom) {
    std::vector<int> path;
    int current = goal;

    while (current != start) {
        path.push_back(current);
        current = cameFrom.at(current);
    }

    path.push_back(start);
    std::reverse(path.begin(), path.end());
    return path;
}
