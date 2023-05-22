// A* Search in Rust

use std::cmp::Reverse;
use std::collections::{BinaryHeap, HashMap};

#[derive(Debug, Eq, PartialEq)]
struct Node {
    vertex: usize,
    cost: u32,
}

impl Ord for Node {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        other.cost.cmp(&self.cost)
    }
}

impl PartialOrd for Node {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

fn ucs(graph: &[HashMap<usize, u32>], start: usize, goal: usize) -> Vec<usize> {
    let mut priority_queue = BinaryHeap::new();
    let mut visited = vec![false; graph.len()];
    let mut cost_so_far = vec![u32::MAX; graph.len()];
    let mut came_from = vec![None; graph.len()];

    priority_queue.push(Node {
        vertex: start,
        cost: 0,
    });
    cost_so_far[start] = 0;

    while let Some(node) = priority_queue.pop() {
        let vertex = node.vertex;

        if vertex == goal {
            break;
        }

        if !visited[vertex] {
            visited[vertex] = true;

            if let Some(neighbors) = graph.get(vertex) {
                for (neighbor, cost) in neighbors {
                    let new_cost = cost_so_far[vertex] + cost;

                    if new_cost < cost_so_far[*neighbor] {
                        cost_so_far[*neighbor] = new_cost;
                        priority_queue.push(Node {
                            vertex: *neighbor,
                            cost: new_cost,
                        });
                        came_from[*neighbor] = Some(vertex);
                    }
                }
            }
        }
    }

    reconstruct_path(start, goal, &came_from)
}

fn reconstruct_path(start: usize, goal: usize, came_from: &[Option<usize>]) -> Vec<usize> {
    let mut path = vec![goal];
    let mut current = goal;

    while let Some(prev) = came_from[current] {
        path.push(prev);
        current = prev;
    }

    path.reverse();
    path
}
