import SwiftUI

@main
struct CustomLauncherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Custom Game Launcher")
                .font(.largeTitle)
                .bold()
            
            Button(action: {
                launchGame()
            }) {
                Text("Launch")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(width: 400, height: 300)
    }
    
    // Generic function demonstrating how macOS apps execute system processes
    func launchGame() {
        let process = Process()
        // Path to the executable or script
        process.executableURL = URL(fileURLWithPath: "/usr/bin/usr") 
        
        // Example arguments passed to an executable
        process.arguments = ["--example-argument"] 
        
        do {
            try process.run()
        } catch {
            print("Failed to start process: \(error)")
        }
    }
}
