// Uniform Cost Search in Java

import java.util.*;

public class Dijkstra {
    public static Map<Integer, Integer> dijkstra(Map<Integer, Map<Integer, Integer>> graph, int start) {
        Map<Integer, Integer> distances = new HashMap<>();
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>();
        Set<Integer> visited = new HashSet<>();

        // Initialize distances with infinity except for the start node
        for (int node : graph.keySet()) {
            distances.put(node, Integer.MAX_VALUE);
        }
        distances.put(start, 0);

        priorityQueue.offer(new Node(start, 0));

        while (!priorityQueue.isEmpty()) {
            Node current = priorityQueue.poll();
            int currentNode = current.getNode();

            // Skip if the current node has already been visited
            if (visited.contains(currentNode)) {
                continue;
            }

            visited.add(currentNode);

            // Explore neighbors of the current node
            for (Map.Entry<Integer, Integer> neighbor : graph.get(currentNode).entrySet()) {
                int neighborNode = neighbor.getKey();
                int weight = neighbor.getValue();
                int distance = distances.get(currentNode) + weight;

                // Update distance if a shorter path is found
                if (distance < distances.get(neighborNode)) {
                    distances.put(neighborNode, distance);
                    priorityQueue.offer(new Node(neighborNode, distance));
                }
            }
        }

        return distances;
    }

    private static class Node implements Comparable<Node> {
        private final int node;
        private final int distance;

        public Node(int node, int distance) {
            this.node = node;
            this.distance = distance;
        }

        public int getNode() {
            return node;
        }

        public int getDistance() {
            return distance;
        }

        @Override
        public int compareTo(Node other) {
            return Integer.compare(this.distance, other.distance);
        }
    }
}


