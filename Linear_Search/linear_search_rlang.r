# Linear Search in R Language

linear_search <- function(arr, target) {
    # Iterate through each element in the vector
    for (i in 1:length(arr)) {
        # Check if the current element is equal to the target element
        if (arr[i] == target) {
            # Return the index of the target element
            return(i)
        }
    }
    # If the target element is not found, return -1
    return(-1)
}
