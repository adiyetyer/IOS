import Foundation

// Initialize an empty shopping list
var shoppingList: [String] = []

// Function to display the menu options
func showMenu() {
    print("""
    1. Add item
    2. Remove item
    3. Display list
    4. Exit
    """)
}

// Main program loop
while true {
    showMenu()  // Display the menu options
    print("Enter your choice: ", terminator: "")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter item to add: ", terminator: "")
            if let item = readLine() {
                shoppingList.append(item)  // Add item to the list
                print("\(item) added to your shopping list.")
            }
            
        case "2":
            print("Enter item to remove: ", terminator: "")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)  // Remove item from the list
                print("\(item) removed from your shopping list.")
            } else {
                print("Item not found.")
            }
            
        case "3":
            print("Your shopping list: \(shoppingList)")  // Display the current shopping list
            
        case "4":
            print("Exiting the program.")
            exit(0)  // Exit the program
            
        default:
            print("Invalid option. Please try again.")
        }
    }
}
