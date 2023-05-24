// Uniform Cost Search in Rust

use std::collections::HashSet;

fn dls(graph: &std::collections::HashMap<&str, Vec<&str>>, node: &str, target: &str, depth: i32, visited: &mut HashSet<&str>) -> bool {
    if depth == 0 && node == target {
        return true;
    }
    if depth > 0 {
        visited.insert(node);
        if let Some(neighbors) = graph.get(node) {
            for neighbor in neighbors {
                if !visited.contains(neighbor) {
                    if dls(graph, neighbor, target, depth - 1, visited) {
                        return true;
                    }
                }
            }
        }
    }
    false
}

fn iddfs(graph: &std::collections::HashMap<&str, Vec<&str>>, start: &str, target: &str, max_depth: i32) -> bool {
    for depth in 0..=max_depth {
        let mut visited = HashSet::new();
        if dls(graph, start, target, depth, &mut visited) {
            return true;
        }
    }
    false
}

fn main() {
    let mut graph = std::collections::HashMap::new();
    graph.insert("A", vec!["B", "C"]);
    graph.insert("B", vec!["D", "E"]);
    graph.insert("C", vec!["F"]);
    graph.insert("D", vec![]);
    graph.insert("E", vec!["F"]);
    graph.insert("F", vec![]);

    let start = "A";
    let target = "F";
    let max_depth = 3;

    if iddfs(&graph, start, target, max_depth) {
        println!("Path exists");
    } else {
        println!("Path does not exist");
    }
}
