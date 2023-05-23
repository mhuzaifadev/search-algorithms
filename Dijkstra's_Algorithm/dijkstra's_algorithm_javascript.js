// Uniform Cost Search in JavaScript

class PriorityQueue {
  constructor() {
    this.queue = [];
  }

  enqueue(node) {
    this.queue.push(node);
    this.queue.sort((a, b) => a.distance - b.distance);
  }

  dequeue() {
    return this.queue.shift();
  }

  isEmpty() {
    return this.queue.length === 0;
  }
}

function dijkstra(graph, start) {
  const distances = {};
  const priorityQueue = new PriorityQueue();

  for (const node in graph) {
    distances[node] = Infinity;
  }
  distances[start] = 0;

  priorityQueue.enqueue({ vertex: start, distance: 0 });

  while (!priorityQueue.isEmpty()) {
    const { vertex, distance } = priorityQueue.dequeue();

    if (distance > distances[vertex]) {
      continue;
    }

    for (const neighbor in graph[vertex]) {
      const neighborDistance = distance + graph[vertex][neighbor];

      if (neighborDistance < distances[neighbor]) {
        distances[neighbor] = neighborDistance;
        priorityQueue.enqueue({ vertex: neighbor, distance: neighborDistance });
      }
    }
  }

  return distances;
}
