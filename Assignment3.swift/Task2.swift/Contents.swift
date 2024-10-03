// Function to check if a number is prime
func isPrime(_ number: Int) -> Bool {
    // Numbers less than 2 are not prime
    if number < 2 {
        return false
    }
    // Check divisibility for numbers between 2 and the number itself
    for i in 2..<number {
        if number % i == 0 {
            return false  // If divisible, not prime
        }
    }
    return true  // If no divisors found, it's a prime number
}

// Loop through numbers from 1 to 100
for number in 1...100 {
    // Use the function to check if the number is prime
    if isPrime(number) {
        print("\(number) is a prime number")
    }
}
