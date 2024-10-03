// Function to return the first n Fibonacci numbers
func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else {
        return []  // Return an empty array if n is less than or equal to zero
    }
    
    var sequence = [0, 1]  // Initialize the sequence with the first two Fibonacci numbers
    
    while sequence.count < n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)  // Add the next Fibonacci number to the sequence
    }
    
    return Array(sequence.prefix(n))  // Return the first n numbers
}

// Test the function
print(fibonacci(10))  // Example: prints the first 10 Fibonacci numbers
