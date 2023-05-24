# Uniform Cost Search in R Language

dijkstra <- function(graph, start) {
  n <- length(graph)
  distances <- rep(Inf, n)
  distances[start] <- 0
  visited <- rep(FALSE, n)

  while (any(!visited)) {
    current <- which.min(distances[!visited])
    visited[current] <- TRUE

    neighbors <- graph[[current]]
    unvisited <- setdiff(names(neighbors), names(distances))

    if (length(unvisited) > 0) {
      distances[unvisited] <- Inf
    }

    for (neighbor in names(neighbors)) {
      if (distances[current] + neighbors[[neighbor]] < distances[neighbor]) {
        distances[neighbor] <- distances[current] + neighbors[[neighbor]]
      }
    }
  }

  distances
}

graph <- list(
  list("1" = 4, "2" = 1),
  list("3" = 1),
  list("1" = 2, "3" = 5),
  list()
)

distances <- dijkstra(graph, 1)

for (i in seq_along(distances)) {
  cat("Distance from 1 to", i, ":", distances[i], "\n")
}
