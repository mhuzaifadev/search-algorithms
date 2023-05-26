// Iterative Deepening DFS Algorithm in Swift

func iddfs(graph: [String: [String]], start: String, target: String, maxDepth: Int) -> Bool {
    for depth in 0...maxDepth {
        var visited: Set<String> = []
        if dls(graph: graph, node: start, target: target, depth: depth, visited: &visited) {
            return true
        }
    }
    return false
}

func dls(graph: [String: [String]], node: String, target: String, depth: Int, visited: inout Set<String>) -> Bool {
    if depth == 0 && node == target {
        return true
    }
    if depth > 0 {
        visited.insert(node)
        if let neighbors = graph[node] {
            for neighbor in neighbors {
                if !visited.contains(neighbor) {
                    if dls(graph: graph, node: neighbor, target: target, depth: depth-1, visited: &visited) {
                        return true
                    }
                }
            }
        }
    }
    return false
}

// Example usage
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["D", "E"],
    "C": ["F"],
    "D": [],
    "E": ["F"],
    "F": []
]

let start = "A"
let target = "F"
let maxDepth = 3

if iddfs(graph: graph, start: start, target: target, maxDepth: maxDepth) {
    print("Path exists")
} else {
    print("Path does not exist")
}
