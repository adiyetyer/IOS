import Foundation

// Function to check if a string is a palindrome
func isPalindrome(_ text: String) -> Bool {
    // Remove spaces, punctuation, and make the text lowercase
    let cleanedText = text.lowercased().filter { $0.isLetter }
    
    // Check if the cleaned text is equal to its reverse
    return cleanedText == String(cleanedText.reversed())
}

// Test the function
let testString = "A man, a plan, a canal, Panama"
print(isPalindrome(testString))  
