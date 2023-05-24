// Uniform Cost Search in JavaScript

function iddfs(graph, start, target, maxDepth) {
  for (let depth = 0; depth <= maxDepth; depth++) {
    let visited = new Set();
    if (dls(graph, start, target, depth, visited)) {
      return true;
    }
  }
  return false;
}

function dls(graph, node, target, depth, visited) {
  if (depth === 0 && node === target) {
    return true;
  }
  if (depth > 0) {
    visited.add(node);
    if (graph[node]) {
      for (let neighbor of graph[node]) {
        if (!visited.has(neighbor)) {
          if (dls(graph, neighbor, target, depth - 1, visited)) {
            return true;
          }
        }
      }
    }
  }
  return false;
}

// Example usage
const graph = {
  'A': ['B', 'C'],
  'B': ['D', 'E'],
  'C': ['F'],
  'D': [],
  'E': ['F'],
  'F': []
};

const start = 'A';
const target = 'F';
const maxDepth = 3;

if (iddfs(graph, start, target, maxDepth)) {
  console.log('Path exists');
} else {
  console.log('Path does not exist');
}
