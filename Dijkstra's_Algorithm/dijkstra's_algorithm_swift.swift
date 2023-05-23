// Uniform Cost Search in Swift

import Foundation

struct Node: Hashable {
    let vertex: Int
    let distance: Int
}

func dijkstra(graph: [Int: [Int: Int]], start: Int) -> [Int: Int] {
    var distances = [Int: Int]()
    for node in graph.keys {
        distances[node] = Int.max
    }
    distances[start] = 0

    var priorityQueue = PriorityQueue<Node>(order: <)
    priorityQueue.enqueue(Node(vertex: start, distance: 0))

    while !priorityQueue.isEmpty {
        let current = priorityQueue.dequeue()!
        let currentNode = current.vertex

        if current.distance > distances[currentNode]! {
            continue
        }

        if let neighbors = graph[currentNode] {
            for (neighbor, weight) in neighbors {
                let distance = current.distance + weight

                if distance < distances[neighbor]! {
                    distances[neighbor] = distance
                    priorityQueue.enqueue(Node(vertex: neighbor, distance: distance))
                }
            }
        }
    }

    return distances
}
