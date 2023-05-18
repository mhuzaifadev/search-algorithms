# **Binary Search Algorithm**

    Input: Sorted list of elements, target element
    Output: Index of the target element in the list (or -1 if not found)

    Set the lower bound (low) as the first index of the list.
    Set the upper bound (high) as the last index of the list.
    Repeat the following steps until the low is less than or equal to high:
        - Calculate the middle index as the average of low and high (integer division).
        - If the middle element is equal to the target element, return the middle index.
        - If the middle element is greater than the target element, set high as the middle index minus one.
        - If the middle element is less than the target element, set low as the middle index plus one.
    If the target element is not found, return -1.