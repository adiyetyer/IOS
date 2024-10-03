import Foundationimport Foundation

// Dictionary to store student names and scores
var studentScores: [String: Int] = [:]

// Function to calculate the average score
func calculateAverage() -> Double {
    let totalScore = studentScores.values.reduce(0, +)
    return totalScore > 0 ? Double(totalScore) / Double(studentScores.count) : 0.0
}

// Function to process student data
func gradeCalculator() {
    let averageScore = calculateAverage()
    
    // Display each student’s score and compare to the average
    for (student, score) in studentScores {
        let comparison = score >= Int(averageScore) ? "above" : "below"
        print("\(student) scored \(score), which is \(comparison) the average.")
    }
    
    // Calculate and display highest and lowest scores
    if let highest = studentScores.values.max(), let lowest = studentScores.values.min() {
        print("Highest score: \(highest)")
        print("Lowest score: \(lowest)")
    }
}

// Input student names and scores
studentScores["ali"] = 85
studentScores["zhalgas"] = 92
studentScores["tony"] = 78
studentScores["gilbert"] = 88

// Call the grade calculator function
gradeCalculator()
