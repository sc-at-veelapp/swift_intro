import SwiftUI

@Observable
final class AppState {
    var hasEnteredApp = false
}

@main
struct movieApp: App {
    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            if appState.hasEnteredApp {
                ContentView()
                    .environment(appState)
            } else {
                Splash()
                    .environment(appState)
            }
        }
    }
}
