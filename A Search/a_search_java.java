// A* Search in Java

import java.util.*;

public class AStarSearch {
    public static List<Integer> astar(Map<Integer, Map<Integer, Integer>> graph, int start, int goal, HeuristicFunction heuristic) {
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>(Comparator.comparingInt(node -> node.priority));  // Create an empty priority queue
        Set<Integer> visited = new HashSet<>();  // Create an empty set to track visited vertices
        Map<Integer, Integer> costSoFar = new HashMap<>();  // Create a map to track the cost to reach each vertex
        Map<Integer, Integer> cameFrom = new HashMap<>();  // Create a map to track the previous vertex in the optimal path

        priorityQueue.offer(new Node(start, 0));  // Enqueue the start vertex with a priority of 0

        while (!priorityQueue.isEmpty()) {
            Node node = priorityQueue.poll();  // Dequeue a vertex with the lowest priority from the priority queue
            int vertex = node.vertex;

            if (vertex == goal) {  // If the vertex is the goal vertex, the optimal path has been found
                break;
            }

            if (!visited.contains(vertex)) {  // If the vertex has not been visited
                visited.add(vertex);  // Mark the vertex as visited

                for (int neighbor : graph.get(vertex).keySet()) {
                    int cost = costSoFar.getOrDefault(vertex, 0) + graph.get(vertex).get(neighbor);  // Calculate the cost to reach the neighbor from the start vertex

                    if (!costSoFar.containsKey(neighbor) || cost < costSoFar.get(neighbor)) {
                        costSoFar.put(neighbor, cost);
                        int priority = cost + heuristic.calculate(neighbor, goal);  // Calculate the priority (cost + heuristic)
                        priorityQueue.offer(new Node(neighbor, priority));  // Enqueue the neighbor onto the priority queue with the calculated priority
                        cameFrom.put(neighbor, vertex);  // Track the previous vertex in the optimal path
                    }
                }
            }
        }

        return reconstructPath(start, goal, cameFrom);  // Return the optimal path
    }

    private static List<Integer> reconstructPath(int start, int goal, Map<Integer, Integer> cameFrom) {
        List<Integer> path = new ArrayList<>();
        int current = goal;

        while (current != start) {
            path.add(current);
            current = cameFrom.get(current);
        }

        path.add(start);
        Collections.reverse(path);
        return path;
    }

    private static class Node {
        int vertex;
        int priority;

        Node(int vertex, int priority) {
            this.vertex = vertex;
            this.priority = priority;
        }
    }
}
