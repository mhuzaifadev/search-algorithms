# Iterative Deepening DFS Algorithm in R Language

dls <- function(graph, node, target, depth, visited) {
  if (depth == 0 && node == target) {
    return(TRUE)
  }
  if (depth > 0) {
    visited <- append(visited, node)
    neighbors <- graph[[node]]
    for (neighbor in neighbors) {
      if (!(neighbor %in% visited)) {
        if (dls(graph, neighbor, target, depth-1, visited)) {
          return(TRUE)
        }
      }
    }
  }
  return(FALSE)
}

iddfs <- function(graph, start, target, maxDepth) {
  for (depth in 0:maxDepth) {
    visited <- character(0)
    if (dls(graph, start, target, depth, visited)) {
      return(TRUE)
    }
  }
  return(FALSE)
}

# Example usage
graph <- list(
  'A' = c('B', 'C'),
  'B' = c('D', 'E'),
  'C' = c('F'),
  'D' = character(0),
  'E' = c('F'),
  'F' = character(0)
)

start <- 'A'
target <- 'F'
maxDepth <- 3

if (iddfs(graph, start, target, maxDepth)) {
  print("Path exists")
} else {
  print("Path does not exist")
}
