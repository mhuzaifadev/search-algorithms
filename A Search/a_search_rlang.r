# Breadth First Search in R Language

astar <- function(graph, start, goal, heuristic) {
  priority_queue <- list()  # Create an empty priority queue
  visited <- set()  # Create an empty set to track visited vertices
  cost_so_far <- list()  # Create a list to track the cost to reach each vertex
  came_from <- list()  # Create a list to track the previous vertex in the optimal path

  enqueue <- function(queue, vertex, priority) {
    queue <- append(queue, list(vertex=vertex, priority=priority))
    return(queue)
  }

  dequeue <- function(queue) {
    queue <- queue[order(sapply(queue, "[[", "priority"))]
    node <- queue[[1]]
    queue <- queue[-1]
    return(list(queue=queue, node=node))
  }

  priority_queue <- enqueue(priority_queue, start, 0)  # Enqueue the start vertex with a priority of 0

  while (length(priority_queue) > 0) {
    result <- dequeue(priority_queue)
    priority_queue <- result$queue
    node <- result$node
    vertex <- node$vertex

    if (vertex == goal) {  # If the vertex is the goal vertex, the optimal path has been found
      break
    }

    if (!(vertex %in% visited)) {  # If the vertex has not been visited
      visited <- union(visited, vertex)  # Mark the vertex as visited

      for (neighbor in names(graph[[vertex]])) {
        cost <- cost_so_far[[vertex]] + graph[[vertex]][[neighbor]]  # Calculate the cost to reach the neighbor from the start vertex

        if (!(neighbor %in% names(cost_so_far)) || cost < cost_so_far[[neighbor]]) {
          cost_so_far[[neighbor]] <- cost
          priority <- cost + heuristic(neighbor, goal)  # Calculate the priority (cost + heuristic)
          priority_queue <- enqueue(priority_queue, neighbor, priority)  # Enqueue the neighbor onto the priority queue with the calculated priority
          came_from[[neighbor]] <- vertex  # Track the previous vertex in the optimal path
        }
      }
    }
  }

  return(reconstruct_path(start, goal, came_from))  # Return the optimal path
}

reconstruct_path <- function(start, goal, came_from) {
  path <- list(goal)
  current <- goal

  while (current != start) {
    next_node <- names(came_from[[current]])[1]
    path <- append(path, next_node)
    current <- next_node
  }

  path <- append(path, start)
  path <- rev(path)
  return(path)
}