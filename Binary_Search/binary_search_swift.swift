// Binary Search in Swift

func binarySearch<T: Comparable>(_ arr: [T], _ target: T) -> Int? {
    // Set the lower bound and upper bound
    var low = 0
    var high = arr.count - 1

    while low <= high {
        // Calculate the middle index
        let mid = (low + high) / 2

        if arr[mid] == target {
            // Return the index if the target is found
            return mid
        } else if arr[mid] < target {
            // Update the lower bound if the target is in the right half
            low = mid + 1
        } else {
            // Update the upper bound if the target is in the left half
            high = mid - 1
        }
    }

    // Return nil if the target is not found
    return nil
}
