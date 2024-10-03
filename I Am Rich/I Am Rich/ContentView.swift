import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Display the diamond image
            Image("diamond")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height:600)  // Adjust the size as necessary
                .padding()
            
            // Display the text label
            Text("I Am Rich")
                .font(.largeTitle)
                .fontWeight(.bold)
                .font(.system(size: 40))
                .foregroundColor(.orange)
                .padding()
        }
        .background(Color(.gray))  // Optional background color change
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
