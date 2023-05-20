// A* Search in Swift

import Foundation

struct Node: Comparable {
    let vertex: Int
    let priority: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.priority < rhs.priority
    }
}

func astar(graph: [[Int: Int]], start: Int, goal: Int, heuristic: (Int, Int) -> Int) -> [Int] {
    var priorityQueue = PriorityQueue<Node>()  // Create an empty priority queue
    var visited = Set<Int>()  // Create an empty set to track visited vertices
    var costSoFar = [Int: Int]()  // Create a dictionary to track the cost to reach each vertex
    var cameFrom = [Int: Int]()  // Create a dictionary to track the previous vertex in the optimal path

    priorityQueue.enqueue(Node(vertex: start, priority: 0))  // Enqueue the start vertex with a priority of 0

    while !priorityQueue.isEmpty {
        let node = priorityQueue.dequeue()!  // Dequeue a vertex with the lowest priority from the priority queue
        let vertex = node.vertex

        if vertex == goal {  // If the vertex is the goal vertex, the optimal path has been found
            break
        }

        if !visited.contains(vertex) {  // If the vertex has not been visited
            visited.insert(vertex)  // Mark the vertex as visited

            for neighbor in graph[vertex]!.keys {
                let cost = costSoFar[vertex, default: 0] + graph[vertex]![neighbor]!  // Calculate the cost to reach the neighbor from the start vertex

                if costSoFar[neighbor] == nil || cost < costSoFar[neighbor]! {
                    costSoFar[neighbor] = cost
                    let priority = cost + heuristic(neighbor, goal)  // Calculate the priority (cost + heuristic)
                    priorityQueue.enqueue(Node(vertex: neighbor, priority: priority))  // Enqueue the neighbor onto the priority queue with the calculated priority
                    cameFrom[neighbor] = vertex  // Track the previous vertex in the optimal path
                }
            }
        }
    }

    return reconstructPath(start: start, goal: goal, cameFrom: cameFrom)  // Return the optimal path
}

func reconstructPath(start: Int, goal: Int, cameFrom: [Int: Int]) -> [Int] {
    var path = [Int]()
    var current = goal

    while current != start {
        path.append(current)
        current = cameFrom[current]!
    }

    path.append(start)
    path.reverse()
    return path
}

class PriorityQueue<T: Comparable> {
    private var heap = [T]()
    var isEmpty: Bool {
        return heap.isEmpty
    }

    func enqueue(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }

    func dequeue() -> T? {
        if heap.isEmpty {
            return nil
        }

        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        siftDown(from: 0)
        return element
    }

    private func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private func siftDown(from index: Int) {
        var parent = index

        while true {
            let leftChild = parent * 2 + 1
            let rightChild = parent * 2 + 2
            var candidate = parent

            if leftChild < heap.count && heap[leftChild] < heap[candidate] {
                candidate = leftChild
            }

            if rightChild < heap.count && heap[rightChild] < heap[candidate] {
                candidate = rightChild
            }

            if candidate == parent {
                return
            }

            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

