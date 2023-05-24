//Uniform Cost Search in C# (C Sharp)

using System;
using System.Collections.Generic;
using System.Linq;

public class Dijkstra
{
    public static Dictionary<int, int> DijkstraAlgorithm(Dictionary<int, Dictionary<int, int>> graph, int start)
    {
        Dictionary<int, int> distances = new Dictionary<int, int>();
        PriorityQueue<Node> priorityQueue = new PriorityQueue<Node>();
        HashSet<int> visited = new HashSet<int>();

        // Initialize distances with infinity except for the start node
        foreach (int node in graph.Keys)
        {
            distances[node] = int.MaxValue;
        }
        distances[start] = 0;

        priorityQueue.Enqueue(new Node(start, 0));

        while (!priorityQueue.IsEmpty)
        {
            Node current = priorityQueue.Dequeue();
            int currentNode = current.Node;

            // Skip if the current node has already been visited
            if (visited.Contains(currentNode))
            {
                continue;
            }

            visited.Add(currentNode);

            // Explore neighbors of the current node
            foreach (var neighbor in graph[currentNode])
            {
                int neighborNode = neighbor.Key;
                int weight = neighbor.Value;
                int distance = distances[currentNode] + weight;

                // Update distance if a shorter path is found
                if (distance < distances[neighborNode])
                {
                    distances[neighborNode] = distance;
                    priorityQueue.Enqueue(new Node(neighborNode, distance));
                }
            }
        }

        return distances;
    }

    private class Node : IComparable<Node>
    {
        public int Node { get; }
        public int Distance { get; }

        public Node(int node, int distance)
        {
            Node = node;
            Distance = distance;
        }

        public int CompareTo(Node other)
        {
            return Distance.CompareTo(other.Distance);
        }
    }

    private class PriorityQueue<T> where T : IComparable<T>
    {
        private List<T> heap;

        public PriorityQueue()
        {
            heap = new List<T>();
        }

        public void Enqueue(T item)
        {
            heap.Add(item);
            int i = heap.Count - 1;

            while (i > 0)
            {
                int parent = (i - 1) / 2;

                if (heap[parent].CompareTo(heap[i]) <= 0)
                {
                    break;
                }

                Swap(parent, i);
                i = parent;
            }
        }

        public T Dequeue()
        {
            T item = heap[0];
            int lastIndex = heap.Count - 1;
            heap[0] = heap[lastIndex];
            heap.RemoveAt(lastIndex);

            int i = 0;
            lastIndex--;

            while (true)
            {
                int leftChild = 2 * i + 1;

                if (leftChild > lastIndex)
                {
                    break;
                }

                int rightChild = leftChild + 1;
                int minChild = leftChild;

                if (rightChild <= lastIndex && heap[rightChild].CompareTo(heap[leftChild]) < 0)
                {
                    minChild = rightChild;
                }

                if (heap[i].CompareTo(heap[minChild]) <= 0)
                {
                    break;
                }

                Swap(i, minChild);
                i = minChild;
            }

            return item;
        }

        public bool IsEmpty
        {
            get { return heap.Count == 0; }
        }

        private void Swap(int i, int j)
        {
            T temp = heap[i];
            heap[i] = heap[j];
            heap[j] = temp;
        }
    }
}
