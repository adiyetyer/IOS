import Foundation  // Import Foundation for input handling

// Function to convert Celsius to Fahrenheit
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32  // Conversion formula
}

// Function to convert Celsius to Kelvin
func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15  // Conversion formula
}

// Function to convert Fahrenheit to Celsius
func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9  // Conversion formula
}

// Function to convert Fahrenheit to Kelvin
func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit + 459.67) * 5/9  // Conversion formula
}

// Function to convert Kelvin to Celsius
func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15  // Conversion formula
}

// Function to convert Kelvin to Fahrenheit
func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    return kelvin * 9/5 - 459.67  // Conversion formula
}

// Main program
print("Enter the temperature value:")  // Ask for temperature input
if let input = readLine(), let temperature = Double(input) {
    // Ask for the unit of temperature (C, F, or K)
    print("Enter the unit of the temperature (C for Celsius, F for Fahrenheit, K for Kelvin):")
    if let unit = readLine() {
        // Convert based on the unit entered
        switch unit.uppercased() {
        case "C":  // Convert Celsius to Fahrenheit and Kelvin
            let fahrenheit = celsiusToFahrenheit(temperature)
            let kelvin = celsiusToKelvin(temperature)
            print("\(temperature)°C is equal to \(fahrenheit)°F and \(kelvin)K")
            
        case "F":  // Convert Fahrenheit to Celsius and Kelvin
            let celsius = fahrenheitToCelsius(temperature)
            let kelvin = fahrenheitToKelvin(temperature)
            print("\(temperature)°F is equal to \(celsius)°C and \(kelvin)K")
            
        case "K":  // Convert Kelvin to Celsius and Fahrenheit
            let celsius = kelvinToCelsius(temperature)
            let fahrenheit = kelvinToFahrenheit(temperature)
            print("\(temperature)K is equal to \(celsius)°C and \(fahrenheit)°F")
            
        default:
            print("Invalid unit entered.")  // Handle invalid input
        }
    } else {
        print("No unit entered.")
    }
} else {
    print("Invalid temperature value entered.")
}
