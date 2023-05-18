# Binary Search in R Language

binary_search <- function(arr, target) {
    # Set the lower bound and upper bound
    low <- 1
    high <- length(arr)

    while (low <= high) {
        # Calculate the middle index
        mid <- floor((low + high) / 2)

        if (arr[mid] == target) {
            # Return the index if the target is found
            return(mid)
        } else if (arr[mid] < target) {
            # Update the lower bound if the target is in the right half
            low <- mid + 1
        } else {
            # Update the upper bound if the target is in the left half
            high <- mid - 1
        }
    }

    # Return -1 if the target is not found
    return(-1)
}
