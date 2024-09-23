//Easy tasks:
//Task1
let fruits = ["Apple", "Banana", "Orange", "Grapes", "Mango"]
print(fruits[2])
//Task2
var numbers: Set = [11, 22, 32, 4]
numbers.insert(14)
print(numbers)
//Task3
let languages = ["swift": 2014, "python": 1991, "java": 1995]
if let swiftYear = languages["swift"] {
    print(swiftYear)
}
//Task3
var colors = ["white", "black", "blue", "red"]
colors[0] = "green"
print(colors)
//Medium tasks:
//Task1
let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]
let intersection = set1.intersection(set2)
print(intersection)
// Task2
var studentScores = ["Adiyet": 85, "Beka": 90, "Tima": 88]
studentScores["Adiyet"] = 95
print(studentScores)
//Task3
let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]
let mergedArray = array1 + array2
print(mergedArray)
//Hard tasks:
//Task1
var countryPopulations = ["Kazakhstan": 19000000, "Germany": 83000000, "Brazil": 211000000]
countryPopulations["Canada"] = 38000000
print(countryPopulations)
//Task2
let set3: Set = ["cat", "dog"]
let set4: Set = ["dog", "mouse"]
let unionSet = set1.union(set2)
let finalSet = unionSet.subtracting(set2)
print(finalSet)



