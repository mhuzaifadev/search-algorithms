//A* Search in C# (C Sharp)

using System;
using System.Collections.Generic;

public class AStarSearch
{
    public static List<int> AStar(Dictionary<int, Dictionary<int, int>> graph, int start, int goal, Func<int, int, int> heuristic)
    {
        var priorityQueue = new PriorityQueue<Node>();  // Create an empty priority queue
        var visited = new HashSet<int>();  // Create an empty set to track visited vertices
        var costSoFar = new Dictionary<int, int>();  // Create a dictionary to track the cost to reach each vertex
        var cameFrom = new Dictionary<int, int>();  // Create a dictionary to track the previous vertex in the optimal path

        priorityQueue.Enqueue(new Node(start, 0));  // Enqueue the start vertex with a priority of 0

        while (priorityQueue.Count > 0)
        {
            var node = priorityQueue.Dequeue();  // Dequeue a vertex with the lowest priority from the priority queue
            var vertex = node.Vertex;

            if (vertex == goal)  // If the vertex is the goal vertex, the optimal path has been found
            {
                break;
            }

            if (!visited.Contains(vertex))  // If the vertex has not been visited
            {
                visited.Add(vertex);  // Mark the vertex as visited

                foreach (var neighbor in graph[vertex].Keys)
                {
                    var cost = costSoFar.GetValueOrDefault(vertex, 0) + graph[vertex][neighbor];  // Calculate the cost to reach the neighbor from the start vertex

                    if (!costSoFar.ContainsKey(neighbor) || cost < costSoFar[neighbor])
                    {
                        costSoFar[neighbor] = cost;
                        var priority = cost + heuristic(neighbor, goal);  // Calculate the priority (cost + heuristic)
                        priorityQueue.Enqueue(new Node(neighbor, priority));  // Enqueue the neighbor onto the priority queue with the calculated priority
                        cameFrom[neighbor] = vertex;  // Track the previous vertex in the optimal path
                    }
                }
            }
        }

        return ReconstructPath(start, goal, cameFrom);  // Return the optimal path
    }

    private static List<int> ReconstructPath(int start, int goal, Dictionary<int, int> cameFrom)
    {
        var path = new List<int>();
        var current = goal;

        while (current != start)
        {
            path.Add(current);
            current = cameFrom[current];
        }

        path.Add(start);
        path.Reverse();
        return path;
    }

    private class Node : IComparable<Node>
    {
        public int Vertex { get; }
        public int Priority { get; }

        public Node(int vertex, int priority)
        {
            Vertex = vertex;
            Priority = priority;
        }

        public int CompareTo(Node other)
        {
            return Priority.CompareTo(other.Priority);
        }
    }
}

