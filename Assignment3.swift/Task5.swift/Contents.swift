import Foundation

// Function to count the frequency of words in a sentence
func wordFrequency(_ sentence: String) -> [String: Int] {
    var frequencyDict: [String: Int] = [:]
    
    // Convert the sentence to lowercase and remove punctuation
    let words = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters.union(.whitespacesAndNewlines)).filter { !$0.isEmpty }
    
    // Loop through words and count their frequency
    for word in words {
        frequencyDict[word, default: 0] += 1  // Increment count for each word
    }
    
    return frequencyDict
}

// Prompt user for a sentence
print("Enter a sentence: ", terminator: "")
if let sentence = readLine() {
    let wordCounts = wordFrequency(sentence)
    print("Word frequencies: \(wordCounts)")  // Display the word frequencies
}
