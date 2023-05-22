// A* Search in Swift

import Foundation

class Node: Comparable {
    let vertex: Int
    let cost: Int
    
    init(vertex: Int, cost: Int) {
        self.vertex = vertex
        self.cost = cost
    }
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.vertex == rhs.vertex
    }
}

func ucs(graph: [Int: [Int: Int]], start: Int, goal: Int) -> [Int] {
    var priorityQueue = PriorityQueue<Node>(ascending: true)
    var visited: Set<Int> = []
    var costSoFar: [Int: Int] = [:]
    var cameFrom: [Int: Int] = [:]
    
    priorityQueue.enqueue(Node(vertex: start, cost: 0))
    costSoFar[start] = 0
    
    while !priorityQueue.isEmpty {
        let node = priorityQueue.dequeue()!
        let vertex = node.vertex
        
        if vertex == goal {
            break
        }
        
        if !visited.contains(vertex) {
            visited.insert(vertex)
            
            guard let neighbors = graph[vertex] else {
                continue
            }
            
            for (neighbor, cost) in neighbors {
                let newCost = (costSoFar[vertex] ?? 0) + cost
                
                if costSoFar[neighbor] == nil || newCost < costSoFar[neighbor]! {
                    costSoFar[neighbor] = newCost
                    priorityQueue.enqueue(Node(vertex: neighbor, cost: newCost))
                    cameFrom[neighbor] = vertex
                }
            }
        }
    }
    
    return reconstructPath(start: start, goal: goal, cameFrom: cameFrom)
}

func reconstructPath(start: Int, goal: Int, cameFrom: [Int: Int]) -> [Int] {
    var path: [Int] = []
    var current = goal
    
    while current != start {
        path.append(current)
        current = cameFrom[current]!
    }
    
    path.append(start)
    path.reverse()
    return path
}
