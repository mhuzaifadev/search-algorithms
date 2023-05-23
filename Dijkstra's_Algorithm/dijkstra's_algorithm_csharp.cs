//Uniform Cost Search in C# (C Sharp)

using System;
using System.Collections.Generic;
using System.Linq;

public class Dijkstra
{
    public static Dictionary<int, int> DijkstraAlgorithm(Dictionary<int, Dictionary<int, int>> graph, int start)
    {
        Dictionary<int, int> distances = new Dictionary<int, int>();
        foreach (int node in graph.Keys)
        {
            distances[node] = int.MaxValue;
        }
        distances[start] = 0;

        SortedSet<Node> priorityQueue = new SortedSet<Node>();
        priorityQueue.Add(new Node(start, 0));

        while (priorityQueue.Count > 0)
        {
            Node current = priorityQueue.Min;
            priorityQueue.Remove(current);

            if (current.Distance > distances[current.Vertex])
            {
                continue;
            }

            foreach (var neighbor in graph[current.Vertex])
            {
                int neighborNode = neighbor.Key;
                int weight = neighbor.Value;
                int distance = distances[current.Vertex] + weight;

                if (distance < distances[neighborNode])
                {
                    priorityQueue.RemoveWhere(n => n.Vertex == neighborNode);
                    distances[neighborNode] = distance;
                    priorityQueue.Add(new Node(neighborNode, distance));
                }
            }
        }

        return distances;
    }

    private class Node : IComparable<Node>
    {
        public int Vertex { get; }
        public int Distance { get; }

        public Node(int vertex, int distance)
        {
            Vertex = vertex;
            Distance = distance;
        }

        public int CompareTo(Node other)
        {
            return Distance.CompareTo(other.Distance);
        }
    }
}
