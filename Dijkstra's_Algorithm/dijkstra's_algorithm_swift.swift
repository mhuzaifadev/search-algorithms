// Dijkstra`s Algorithm in Swift

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
            for neighbor in neighbors {
                let neighborNode = neighbor.key
                let weight = neighbor.value
                let distance = current.distance + weight

                if distance < distances[neighborNode]! {
                    distances[neighborNode] = distance
                    priorityQueue.enqueue(Node(vertex: neighborNode, distance: distance))
                }
            }
        }
    }

    return distances
}

// PriorityQueue implementation
struct PriorityQueue<Element> {
    private var elements: [Element]
    private let order: (Element, Element) -> Bool

    init(order: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.order = order
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    mutating func enqueue(_ element: Element) {
        var i = elements.count
        elements.append(element)

        while i > 0, order(element, elements[(i - 1) / 2]) {
            elements.swapAt(i, (i - 1) / 2)
            i = (i - 1) / 2
        }
    }

    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }

        if elements.count == 1 {
            return elements.removeFirst()
        }

        let first = elements[0]
        elements[0] = elements.removeLast()

        var i = 0
        while 2 * i + 1 < elements.count {
            var child = 2 * i + 1

            if child + 1 < elements.count, order(elements[child + 1], elements[child]) {
                child += 1
            }

            if order(elements[child], elements[i]) {
                elements.swapAt(i, child)
                i = child
            } else {
                break
            }
        }

        return first
    }
}

let graph = [
    0: [1: 4, 2: 1],
    1: [3: 1],
    2: [1: 2, 3: 5],
    3: [:]
]

let distances = dijkstra(graph: graph, start: 0)

for (vertex, distance) in distances {
    print("Distance from 0 to \(vertex): \(distance)")
}
