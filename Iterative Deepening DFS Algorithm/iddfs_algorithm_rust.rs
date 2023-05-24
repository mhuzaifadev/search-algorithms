// Uniform Cost Search in Rust

use std::cmp::Ordering;
use std::collections::BinaryHeap;
use std::usize;

#[derive(Eq, PartialEq)]
struct Node {
    vertex: usize,
    distance: i32,
}

impl Ord for Node {
    fn cmp(&self, other: &Self) -> Ordering {
        other.distance.cmp(&self.distance)
    }
}

impl PartialOrd for Node {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn dijkstra(graph: &[Vec<(usize, i32)>], start: usize) -> Vec<i32> {
    let n = graph.len();
    let mut distances = vec![i32::MAX; n];
    distances[start] = 0;

    let mut priority_queue = BinaryHeap::new();
    priority_queue.push(Node {
        vertex: start,
        distance: 0,
    });

    while let Some(current) = priority_queue.pop() {
        let current_node = current.vertex;

        if current.distance > distances[current_node] {
            continue;
        }

        for neighbor in &graph[current_node] {
            let neighbor_node = neighbor.0;
            let weight = neighbor.1;
            let distance = distances[current_node] + weight;

            if distance < distances[neighbor_node] {
                distances[neighbor_node] = distance;
                priority_queue.push(Node {
                    vertex: neighbor_node,
                    distance,
                });
            }
        }
    }

    distances
}

fn main() {
    let n = 4;
    let graph = vec![
        vec![(1, 4), (2, 1)],
        vec![(3, 1)],
        vec![(1, 2), (3, 5)],
        vec![],
    ];

    let distances = dijkstra(&graph, 0);

    for (vertex, distance) in distances.iter().enumerate() {
        println!("Distance from 0 to {}: {}", vertex, distance);
    }
}
