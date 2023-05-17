// Linear Search in Swift

func linearSearch<T: Equatable>(_ arr: [T], _ target: T) -> Int? {
    // Iterate through each element in the array
    for (index, element) in arr.enumerated() {
        // Check if the current element is equal to the target element
        if element == target {
            // Return the index of the target element
            return index
        }
    }
    // If the target element is not found, return nil
    return nil
}
