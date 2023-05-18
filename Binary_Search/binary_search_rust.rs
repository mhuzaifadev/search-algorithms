// Binary Search in Rust

fn binary_search(arr: &[i32], target: i32) -> Option<usize> {
    // Set the lower bound and upper bound
    let mut low = 0;
    let mut high = arr.len() - 1;

    while low <= high {
        // Calculate the middle index
        let mid = (low + high) / 2;

        if arr[mid] == target {
            // Return the index if the target is found
            return Some(mid);
        } else if arr[mid] < target {
            // Update the lower bound if the target is in the right half
            low = mid + 1;
        } else {
            // Update the upper bound if the target is in the left half
            high = mid - 1;
        }
    }

    // Return None if the target is not found
    None
}

