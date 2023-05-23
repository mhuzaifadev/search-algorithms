// Uniform Cost Search in Rust

use std::cmp::Ordering;
use std::collections::BinaryHeap;

#[derive(Debug, Eq)]
struct Node {
    vertex: usize,
    distance: u32,
}

impl PartialEq for Node {
    fn eq(&self, other: &Self) -> bool {
        self.distance.eq(&other.distance)
    }
}

impl PartialOrd for Node {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

impl Ord for Node {
    fn cmp(&self, other: &Self) -> Ordering {
        other.distance.cmp(&self.distance)
    }
}

fn dijkstra(graph: &[Vec<(usize, u32)>], start: usize) -> Vec<u32> {
    let mut distances = vec![u32::MAX; graph.len()];
    let mut priority_queue = BinaryHeap::new();

    distances[start] = 0;
    priority_queue.push(Node {
        vertex: start,
        distance: 0,
    });

    while let Some(Node { vertex, distance }) = priority_queue.pop() {
        if distance > distances[vertex] {
            continue;
        }

        for &(neighbor, weight) in &graph[vertex] {
            let new_distance = distance + weight;

            if new_distance < distances[neighbor] {
                distances[neighbor] = new_distance;
                priority_queue.push(Node {
                    vertex: neighbor,
                    distance: new_distance,
                });
            }
        }
    }

    distances
}

fn main() {
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
