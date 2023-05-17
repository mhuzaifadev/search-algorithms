# Linear Search in Python

def linear_search(arr, target):
    # Iterate through each element in the list
    for i in range(len(arr)):
        # Check if the current element is equal to the target element
        if arr[i] == target:
            # Return the index of the target element
            return i
    # If the target element is not found, return -1
    return -1
