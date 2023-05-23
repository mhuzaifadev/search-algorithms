// Uniform Cost Search in Java

import java.util.*;

class Node implements Comparable<Node> {
    int vertex;
    int cost;

    public Node(int vertex, int cost) {
        this.vertex = vertex;
        this.cost = cost;
    }

    public int compareTo(Node other) {
        return Integer.compare(this.cost, other.cost);
    }
}

public class UCS {
    public List<Integer> ucs(Map<Integer, Map<Integer, Integer>> graph, int start, int goal) {
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>();
        Set<Integer> visited = new HashSet<>();
        Map<Integer, Integer> costSoFar = new HashMap<>();
        Map<Integer, Integer> cameFrom = new HashMap<>();

        priorityQueue.offer(new Node(start, 0));
        costSoFar.put(start, 0);

        while (!priorityQueue.isEmpty()) {
            Node node = priorityQueue.poll();
            int vertex = node.vertex;

            if (vertex == goal) {
                break;
            }

            if (!visited.contains(vertex)) {
                visited.add(vertex);

                for (Map.Entry<Integer, Integer> neighbor : graph.get(vertex).entrySet()) {
                    int neighborVertex = neighbor.getKey();
                    int cost = neighbor.getValue();
                    int newCost = costSoFar.get(vertex) + cost;

                    if (!costSoFar.containsKey(neighborVertex) || newCost < costSoFar.get(neighborVertex)) {
                        costSoFar.put(neighborVertex, newCost);
                        priorityQueue.offer(new Node(neighborVertex, newCost));
                        cameFrom.put(neighborVertex, vertex);
                    }
                }
            }
        }

        return reconstructPath(start, goal, cameFrom);
    }

    private List<Integer> reconstructPath(int start, int goal, Map<Integer, Integer> cameFrom) {
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
}

