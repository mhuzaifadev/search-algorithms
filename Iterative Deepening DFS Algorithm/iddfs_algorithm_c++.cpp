// Uniform Cost Search in C++

#include <iostream>
#include <unordered_map>
#include <vector>
#include <unordered_set>

using namespace std;

bool dls(const unordered_map<string, vector<string>>& graph, const string& node, const string& target, int depth, unordered_set<string>& visited) {
    if (depth == 0 && node == target) {
        return true;
    }
    if (depth > 0) {
        visited.insert(node);
        const vector<string>& neighbors = graph.at(node);
        for (const string& neighbor : neighbors) {
            if (visited.find(neighbor) == visited.end()) {
                if (dls(graph, neighbor, target, depth - 1, visited)) {
                    return true;
                }
            }
        }
    }
    return false;
}

bool iddfs(const unordered_map<string, vector<string>>& graph, const string& start, const string& target, int maxDepth) {
    for (int depth = 0; depth <= maxDepth; depth++) {
        unordered_set<string> visited;
        if (dls(graph, start, target, depth, visited)) {
            return true;
        }
    }
    return false;
}

int main() {
    unordered_map<string, vector<string>> graph = {
        {"A", {"B", "C"}},
        {"B", {"D", "E"}},
        {"C", {"F"}},
        {"D", {}},
        {"E", {"F"}},
        {"F", {}}
    };

    string start = "A";
    string target = "F";
    int maxDepth = 3;

    if (iddfs(graph, start, target, maxDepth)) {
        cout << "Path exists" << endl;
    } else {
        cout << "Path does not exist" << endl;
    }

    return 0;
}
