//Uniform Cost Search in C# (C Sharp)

using System;
using System.Collections.Generic;

public class IDDFS
{
    public static bool IDDFSAlgorithm(Dictionary<string, List<string>> graph, string start, string target, int maxDepth)
    {
        for (int depth = 0; depth <= maxDepth; depth++)
        {
            HashSet<string> visited = new HashSet<string>();
            if (DLS(graph, start, target, depth, visited))
            {
                return true;
            }
        }
        return false;
    }

    public static bool DLS(Dictionary<string, List<string>> graph, string node, string target, int depth, HashSet<string> visited)
    {
        if (depth == 0 && node == target)
        {
            return true;
        }
        if (depth > 0)
        {
            visited.Add(node);
            if (graph.ContainsKey(node))
            {
                foreach (string neighbor in graph[node])
                {
                    if (!visited.Contains(neighbor))
                    {
                        if (DLS(graph, neighbor, target, depth - 1, visited))
                        {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    public static void Main(string[] args)
    {
        Dictionary<string, List<string>> graph = new Dictionary<string, List<string>>()
        {
            { "A", new List<string> { "B", "C" } },
            { "B", new List<string> { "D", "E" } },
            { "C", new List<string> { "F" } },
            { "D", new List<string> { } },
            { "E", new List<string> { "F" } },
            { "F", new List<string> { } }
        };

        string start = "A";
        string target = "F";
        int maxDepth = 3;

        if (IDDFSAlgorithm(graph, start, target, maxDepth))
        {
            Console.WriteLine("Path exists");
        }
        else
        {
            Console.WriteLine("Path does not exist");
        }
    }
}
