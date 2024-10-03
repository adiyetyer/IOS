// Function to check if a string has all unique characters
func hasUniqueCharacters(_ text: String) -> Bool {
    var seenCharacters: Set<Character> = []  // A set to track characters
    
    // Loop through each character in the string
    for char in text {
        // If character is already in the set, return false (not unique)
        if seenCharacters.contains(char) {
            return false
        }
        // Add the character to the set
        seenCharacters.insert(char)
    }
    
    // If no duplicates found, return true (all unique)
    return true
}

// Test cases
print(hasUniqueCharacters("Hello"))  // Output: false (H and e are unique but l repeats)
print(hasUniqueCharacters("World"))  // Output: true (All characters are unique)
