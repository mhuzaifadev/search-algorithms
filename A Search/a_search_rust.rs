// A* Search in Rust

use std::collections::{BinaryHeap, HashMap, HashSet};

#[derive(Copy, Clone, Eq, PartialEq)]
struct Node {
    vertex: i32,
    priority: i32,
}

impl Ord for Node {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        other.priority.cmp(&self.priority)
    }
}

impl PartialOrd for Node {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

pub fn astar(graph: &HashMap<i32, HashMap<i32, i32>>, start: i32, goal: i32, heuristic: fn(i32, i32) -> i32) -> Vec<i32> {
    let mut priority_queue = BinaryHeap::new();  // Create an empty priority queue
    let mut visited = HashSet::new();  // Create an empty set to track visited vertices
    let mut cost_so_far = HashMap::new();  // Create a hashmap to track the cost to reach each vertex
    let mut came_from = HashMap::new();  // Create a hashmap to track the previous vertex in the optimal path

    priority_queue.push(Node { vertex: start, priority: 0 });  // Enqueue the start vertex with a priority of 0

    while let Some(node) = priority_queue.pop() {
        let vertex = node.vertex;

        if vertex == goal {  // If the vertex is the goal vertex, the optimal path has been found
            break;
        }

        if !visited.contains(&vertex) {  // If the vertex has not been visited
            visited.insert(vertex);  // Mark the vertex as visited

            for neighbor in graph[&vertex].keys() {
                let cost = *cost_so_far.get(&vertex).unwrap_or(&0) + graph[&vertex][neighbor];  // Calculate the cost to reach the neighbor from the start vertex

                if !cost_so_far.contains_key(neighbor) || cost < *cost_so_far.get(neighbor).unwrap() {
                    cost_so_far.insert(*neighbor, cost);
                    let priority = cost + heuristic(*neighbor, goal);  // Calculate the priority (cost + heuristic)
                    priority_queue.push(Node { vertex: *neighbor, priority });  // Enqueue the neighbor onto the priority queue with the calculated priority
                    came_from.insert(*neighbor, vertex);  // Track the previous vertex in the optimal path
                }
            }
        }
    }

    reconstruct_path(start, goal, &came_from)  // Return the optimal path
}

fn reconstruct_path(start: i32, goal: i32, came_from: &HashMap<i32, i32>) -> Vec<i32> {
    let mut path = Vec::new();
    let mut current = goal;

    while current != start {
        path.push(current);
        current = *came_from.get(&current).unwrap();
    }

    path.push(start);
    path.reverse();
    path
}

