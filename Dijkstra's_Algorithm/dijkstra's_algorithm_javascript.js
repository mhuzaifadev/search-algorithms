// Uniform Cost Search in JavaScript

class PriorityQueue {
  constructor(comparator = (a, b) => a.priority < b.priority) {
    this.heap = [];
    this.comparator = comparator;
  }

  enqueue(element, priority) {
    const node = { element, priority };
    this.heap.push(node);
    this.bubbleUp(this.heap.length - 1);
  }

  dequeue() {
    if (this.isEmpty()) {
      return null;
    }
    this.swap(0, this.heap.length - 1);
    const node = this.heap.pop();
    this.bubbleDown(0);
    return node.element;
  }

  isEmpty() {
    return this.heap.length === 0;
  }

  bubbleUp(index) {
    const parentIndex = Math.floor((index - 1) / 2);
    if (index > 0 && this.comparator(this.heap[index], this.heap[parentIndex])) {
      this.swap(index, parentIndex);
      this.bubbleUp(parentIndex);
    }
  }

  bubbleDown(index) {
    const leftChildIndex = 2 * index + 1;
    const rightChildIndex = 2 * index + 2;
    let smallestChildIndex = index;

    if (
      leftChildIndex < this.heap.length &&
      this.comparator(this.heap[leftChildIndex], this.heap[smallestChildIndex])
    ) {
      smallestChildIndex = leftChildIndex;
    }

    if (
      rightChildIndex < this.heap.length &&
      this.comparator(this.heap[rightChildIndex], this.heap[smallestChildIndex])
    ) {
      smallestChildIndex = rightChildIndex;
    }

    if (smallestChildIndex !== index) {
      this.swap(index, smallestChildIndex);
      this.bubbleDown(smallestChildIndex);
    }
  }

  swap(index1, index2) {
    [this.heap[index1], this.heap[index2]] = [this.heap[index2], this.heap[index1]];
  }
}

function dijkstra(graph, start) {
  const distances = {};
  const priorityQueue = new PriorityQueue((a, b) => a.distance < b.distance);
  const visited = new Set();

  // Initialize distances with infinity except for the start node
  for (const node in graph) {
    distances[node] = Infinity;
  }
  distances[start] = 0;

  priorityQueue.enqueue({ node: start, distance: 0 });

  while (!priorityQueue.isEmpty()) {
    const current = priorityQueue.dequeue();
    const currentNode = current.node;

    // Skip if the current node has already been visited
    if (visited.has(currentNode)) {
      continue;
    }

    visited.add(currentNode);

    // Explore neighbors of the current node
    for (const neighbor in graph[currentNode]) {
      const neighborNode = parseInt(neighbor);
      const weight = graph[currentNode][neighbor];
      const distance = distances[currentNode] + weight;

      // Update distance if a shorter path is found
      if (distance < distances[neighborNode]) {
        distances[neighborNode] = distance;
        priorityQueue.enqueue({ node: neighborNode, distance });
      }
    }
  }

  return distances;
}

const graph = {
  0: { 1: 4, 2: 1 },
  1: { 3: 1 },
  2: { 1: 2, 3: 5 },
  3: {},
};

const distances = dijkstra(graph, 0);

for (const node in distances) {
  console.log(`Distance from 0 to ${node}: ${distances[node]}`);
}
