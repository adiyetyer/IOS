import Foundation

// Function for addition
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

// Function for subtraction
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

// Function for multiplication
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

// Function for division with division by zero handling
func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error: Division by zero is not allowed.")
        return nil  // Return nil if division by zero
    }
    return a / b
}

// Main program loop
while true {
    // Prompt user for two numbers
    print("Enter the first number: ", terminator: "")
    let input1 = readLine() ?? ""
    
    print("Enter the second number: ", terminator: "")
    let input2 = readLine() ?? ""
    
    // Convert input to Double
    if let num1 = Double(input1), let num2 = Double(input2) {
        // Ask the user for an operation
        print("Choose an operation (+, -, *, /) or type 'exit' to quit: ", terminator: "")
        if let operation = readLine() {
            switch operation {
            case "+":
                print("Result: \(add(num1, num2))")  // Perform addition
            case "-":
                print("Result: \(subtract(num1, num2))")  // Perform subtraction
            case "*":
                print("Result: \(multiply(num1, num2))")  // Perform multiplication
            case "/":
                if let result = divide(num1, num2) {  // Perform division and handle divide by zero
                    print("Result: \(result)")
                }
            case "exit":
                print("Exiting the calculator.")
                exit(0)  // Exit the program
            default:
                print("Invalid operation. Please try again.")
            }
        }
    } else {
        print("Invalid number input. Please enter valid numbers.")
    }
}
