// Breadth First Search in JavaScript

class Node {
    constructor(vertex, priority) {
        this.vertex = vertex;
        this.priority = priority;
    }
}

function astar(graph, start, goal, heuristic) {
    const priorityQueue = new PriorityQueue();  // Create an empty priority queue
    const visited = new Set();  // Create an empty set to track visited vertices
    const costSoFar = new Map();  // Create a map to track the cost to reach each vertex
    const cameFrom = new Map();  // Create a map to track the previous vertex in the optimal path

    priorityQueue.enqueue(new Node(start, 0));  // Enqueue the start vertex with a priority of 0

    while (!priorityQueue.isEmpty()) {
        const node = priorityQueue.dequeue();  // Dequeue a vertex with the lowest priority from the priority queue
        const vertex = node.vertex;

        if (vertex === goal) {  // If the vertex is the goal vertex, the optimal path has been found
            break;
        }

        if (!visited.has(vertex)) {  // If the vertex has not been visited
            visited.add(vertex);  // Mark the vertex as visited

            for (const neighbor of Object.keys(graph[vertex])) {
                const cost = (costSoFar.get(vertex) || 0) + graph[vertex][neighbor];  // Calculate the cost to reach the neighbor from the start vertex

                if (!costSoFar.has(neighbor) || cost < costSoFar.get(neighbor)) {
                    costSoFar.set(neighbor, cost);
                    const priority = cost + heuristic(neighbor, goal);  // Calculate the priority (cost + heuristic)
                    priorityQueue.enqueue(new Node(neighbor, priority));  // Enqueue the neighbor onto the priority queue with the calculated priority
                    cameFrom.set(neighbor, vertex);  // Track the previous vertex in the optimal path
                }
            }
        }
    }

    return reconstructPath(start, goal, cameFrom);  // Return the optimal path
}

function reconstructPath(start, goal, cameFrom) {
    const path = [];
    let current = goal;

    while (current !== start) {
        path.push(current);
        current = cameFrom.get(current);
    }

    path.push(start);
    path.reverse();
    return path;
}

class PriorityQueue {
    constructor() {
        this.heap = [];
    }

    isEmpty() {
        return this.heap.length === 0;
    }

    enqueue(element) {
        this.heap.push(element);
        this.siftUp(this.heap.length - 1);
    }

    dequeue() {
        if (this.isEmpty()) {
            return null;
        }

        const element = this.heap[0];
        this.heap[0] = this.heap[this.heap.length - 1];
        this.heap.pop();
        this.siftDown(0);
        return element;
    }

    siftUp(index) {
        let child = index;
        let parent = Math.floor((child - 1) / 2);

        while (child > 0 && this.heap[child].priority < this.heap[parent].priority) {
            [this.heap[child], this.heap[parent]] = [this.heap[parent], this.heap[child]];
            child = parent;
            parent = Math.floor((child - 1) / 2);
        }
    }

    siftDown(index) {
        let parent = index;

        while (true) {
            const leftChild = parent * 2 + 1;
            const rightChild = parent * 2 + 2;
            let candidate = parent;

            if (leftChild < this.heap.length && this.heap[leftChild].priority < this.heap[candidate].priority) {
                candidate = leftChild;
            }

            if (rightChild < this.heap.length && this.heap[rightChild].priority < this.heap[candidate].priority) {
                candidate = rightChild;
            }

            if (candidate === parent) {
                return;
            }

            [this.heap[parent], this.heap[candidate]] = [this.heap[candidate], this.heap[parent]];
            parent = candidate;
        }
    }
}

