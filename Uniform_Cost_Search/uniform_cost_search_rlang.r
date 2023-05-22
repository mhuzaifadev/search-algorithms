# A* Search in R Language

# Install the priorityqueue package if not already installed
# install.packages("priorityqueue")

library(priorityqueue)

ucs <- function(graph, start, goal) {
  priority_queue <- priority_queue$new(order = "min")
  visited <- set()
  cost_so_far <- list()
  came_from <- list()

  priority_queue$insert(start, 0)
  cost_so_far[[start]] <- 0

  while (!priority_queue$is_empty()) {
    node <- priority_queue$pop()
    vertex <- node$elem

    if (vertex == goal) {
      break
    }

    if (!(vertex %in% visited)) {
      visited <- union(visited, vertex)

      neighbors <- graph[[vertex]]
      for (neighbor in names(neighbors)) {
        cost <- neighbors[[neighbor]]
        new_cost <- cost_so_far[[vertex]] + cost

        if (!(neighbor %in% names(cost_so_far)) || new_cost < cost_so_far[[neighbor]]) {
          cost_so_far[[neighbor]] <- new_cost
          priority_queue$insert(neighbor, new_cost)
          came_from[[neighbor]] <- vertex
        }
      }
    }
  }

  reconstruct_path(start, goal, came_from)
}

reconstruct_path <- function(start, goal, came_from) {
  path <- vector("list", 0)
  current <- goal

  while (current != start) {
    path <- c(path, current)
    current <- came_from[[current]]
  }

  path <- c(path, start)
  path <- rev(path)
  return(path)
}
