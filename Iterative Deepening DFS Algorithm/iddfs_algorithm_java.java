// Uniform Cost Search in Java

import java.util.*;

public class IDDFS {
    public static boolean iddfs(Map<String, List<String>> graph, String start, String target, int maxDepth) {
        for (int depth = 0; depth <= maxDepth; depth++) {
            Set<String> visited = new HashSet<>();
            if (dls(graph, start, target, depth, visited)) {
                return true;
            }
        }
        return false;
    }

    public static boolean dls(Map<String, List<String>> graph, String node, String target, int depth, Set<String> visited) {
        if (depth == 0 && node.equals(target)) {
            return true;
        }
        if (depth > 0) {
            visited.add(node);
            List<String> neighbors = graph.get(node);
            if (neighbors != null) {
                for (String neighbor : neighbors) {
                    if (!visited.contains(neighbor)) {
                        if (dls(graph, neighbor, target, depth - 1, visited)) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    public static void main(String[] args) {
        Map<String, List<String>> graph = new HashMap<>();
        graph.put("A", Arrays.asList("B", "C"));
        graph.put("B", Arrays.asList("D", "E"));
        graph.put("C", Arrays.asList("F"));
        graph.put("D", new ArrayList<>());
        graph.put("E", Arrays.asList("F"));
        graph.put("F", new ArrayList<>());

        String start = "A";
        String target = "F";
        int maxDepth = 3;

        if (iddfs(graph, start, target, maxDepth)) {
            System.out.println("Path exists");
        } else {
            System.out.println("Path does not exist");
        }
    }
}
