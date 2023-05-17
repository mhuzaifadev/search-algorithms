// Linear Search in Rust

fn linear_search<T: PartialEq>(arr: &[T], target: &T) -> Option<usize> {
    // Iterate through each element in the slice
    for (i, element) in arr.iter().enumerate() {
        // Check if the current element is equal to the target element
        if element == target {
            // Return the index of the target element
            return Some(i);
        }
    }
    // If the target element is not found, return None
    None
}
