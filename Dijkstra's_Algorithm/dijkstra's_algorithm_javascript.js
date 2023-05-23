// Uniform Cost Search in JavaScript

class Node {
    constructor(vertex, cost) {
      this.vertex = vertex;
      this.cost = cost;
    }
  }
  
  class PriorityQueue {
    constructor() {
      this.queue = [];
    }
  
    enqueue(node) {
      this.queue.push(node);
      this.queue.sort((a, b) => a.cost - b.cost);
    }
  
    dequeue() {
      return this.queue.shift();
    }
  
    isEmpty() {
      return this.queue.length === 0;
    }
  }
  
  function ucs(graph, start, goal) {
    const priorityQueue = new PriorityQueue();
    const visited = new Set();
    const costSoFar = {};
    const cameFrom = {};
  
    priorityQueue.enqueue(new Node(start, 0));
    costSoFar[start] = 0;
  
    while (!priorityQueue.isEmpty()) {
      const node = priorityQueue.dequeue();
      const vertex = node.vertex;
  
      if (vertex === goal) {
        break;
      }
  
      if (!visited.has(vertex)) {
        visited.add(vertex);
  
        const neighbors = graph[vertex];
        for (const neighbor in neighbors) {
          const cost = neighbors[neighbor];
          const newCost = (costSoFar[vertex] || 0) + cost;
  
          if (!costSoFar.hasOwnProperty(neighbor) || newCost < costSoFar[neighbor]) {
            costSoFar[neighbor] = newCost;
            priorityQueue.enqueue(new Node(neighbor, newCost));
            cameFrom[neighbor] = vertex;
          }
        }
      }
    }
  
    return reconstructPath(start, goal, cameFrom);
  }
  
  function reconstructPath(start, goal, cameFrom) {
    const path = [];
    let current = goal;
  
    while (current !== start) {
      path.push(current);
      current = cameFrom[current];
    }
  
    path.push(start);
    return path.reverse();
  }
  