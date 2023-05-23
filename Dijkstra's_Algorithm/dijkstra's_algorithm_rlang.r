# Uniform Cost Search in R Language

library(pqueue)

dijkstra <- function(graph, start) {
  distances <- rep(Inf, length(graph))
  distances[start] <- 0
  pq <- pqueue$new(order = "min")
  pq$insert(start, 0)

  while (!pq$is_empty()) {
    node <- pq$pop()
    current_node <- node$elem
    current_distance <- node$priority

    if (current_distance > distances[current_node]) {
      next
    }

    neighbors <- graph[[current_node]]

    for (i in seq_along(neighbors$vertex)) {
      neighbor_node <- neighbors$vertex[i]
      neighbor_distance <- neighbors$distance[i]
      distance <- current_distance + neighbor_distance

      if (distance < distances[neighbor_node]) {
        distances[neighbor_node] <- distance
        pq$insert(neighbor_node, distance)
      }
    }
  }

  distances
}
