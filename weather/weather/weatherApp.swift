import SwiftUI

enum Tab: Hashable {
    case kathmandu, delhi, beijing, london
}

struct ContentView: View {
    @State private var selectedTab: Tab = .kathmandu
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WeatherScreen(location: "Kathmandu, Nepal").tabItem {
                Label("Kathmandu", systemImage: "cloud.sun")
            }.tag(Tab.kathmandu)

            WeatherScreen(location: "Delhi, India").tabItem {
                Label("Delhi", systemImage: "sun.max")
            }.tag(Tab.delhi)

            WeatherScreen(location: "Beijing, China").tabItem {
                Label("Beijing", systemImage: "cloud.rain")
            }.tag(Tab.beijing)

            WeatherScreen(location: "London, UK").tabItem {
                Label("London", systemImage: "cloud.bolt")
            }.tag(Tab.london)
        }
    }
}

struct WeatherScreen: View {
    let location: String
    @State private var isNight = false

    var body: some View {
        ZStack {
            Background(isNight: isNight)
            UI(
                location: location,
                currentTemperature: 0,
                condition: "Cloudy",
                isNight: $isNight
            )
        }
    }
}

@main
struct weatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview {
    ContentView()
}
