//A* Search in C# (C Sharp)

using System;
using System.Collections.Generic;

public class UCS
{
    public List<int> Ucs(Dictionary<int, Dictionary<int, int>> graph, int start, int goal)
    {
        PriorityQueue<Node> priorityQueue = new PriorityQueue<Node>();
        HashSet<int> visited = new HashSet<int>();
        Dictionary<int, int> costSoFar = new Dictionary<int, int>();
        Dictionary<int, int> cameFrom = new Dictionary<int, int>();

        priorityQueue.Enqueue(new Node(start, 0));
        costSoFar[start] = 0;

        while (priorityQueue.Count > 0)
        {
            Node node = priorityQueue.Dequeue();
            int vertex = node.Vertex;

            if (vertex == goal)
            {
                break;
            }

            if (!visited.Contains(vertex))
            {
                visited.Add(vertex);

                foreach (KeyValuePair<int, int> neighbor in graph[vertex])
                {
                    int neighborVertex = neighbor.Key;
                    int cost = neighbor.Value;
                    int newCost = costSoFar[vertex] + cost;

                    if (!costSoFar.ContainsKey(neighborVertex) || newCost < costSoFar[neighborVertex])
                    {
                        costSoFar[neighborVertex] = newCost;
                        priorityQueue.Enqueue(new Node(neighborVertex, newCost));
                        cameFrom[neighborVertex] = vertex;
                    }
                }
            }
        }

        return ReconstructPath(start, goal, cameFrom);
    }

    private List<int> ReconstructPath(int start, int goal, Dictionary<int, int> cameFrom)
    {
        List<int> path = new List<int>();
        int current = goal;

        while (current != start)
        {
            path.Add(current);
            current = cameFrom[current];
        }

        path.Add(start);
        path.Reverse();
        return path;
    }
}

public class Node : IComparable<Node>
{
    public int Vertex { get; }
    public int Cost { get; }

    public Node(int vertex, int cost)
    {
        Vertex = vertex;
        Cost = cost;
    }

    public int CompareTo(Node other)
    {
        return Cost.CompareTo(other.Cost);
    }
}
