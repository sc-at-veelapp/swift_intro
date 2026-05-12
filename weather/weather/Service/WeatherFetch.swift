import Foundation
import SwiftUI
import Combine

struct WeatherResponse: Decodable {
    let list: [WeatherEntry]
}

struct WeatherEntry: Decodable {
    let dt: TimeInterval
    let main: Main
    let weather: [WeatherCondition]
}

struct Main: Decodable {
    let temp: Double
}

struct WeatherCondition: Decodable {
    let main: String
}

func mapToDaily(_ response: WeatherResponse) -> [DayWeather] {
    let formatter = DateFormatter()
    formatter.dateFormat = "E"

    return response.list.prefix(6).map { entry in
        let date = Date(timeIntervalSince1970: entry.dt)
        let day = formatter.string(from: date).uppercased()
        
        let icon = mapConditionToIcon(entry.weather.first?.main ?? "")
        
        return DayWeather(
            day: day,
            icon: icon,
            temperature: Int8(entry.main.temp)
        )
    }
}

func mapConditionToIcon(_ condition: String) -> String {
    switch condition {
    case "Clear": return "sun.max.fill"
    case "Clouds": return "cloud.sun.fill"
    case "Rain": return "cloud.rain.fill"
    case "Snow": return "cloud.snow.fill"
    case "Thunderstorm": return "cloud.bolt.fill"
    default: return "cloud.fill"
    }
}

class WeatherService {
    func fetchWeather() async throws -> WeatherResponse {
        let url = URL(string:
            "https://api.openweathermap.org/data/2.5/forecast?q=Kathmandu&appid=YOUR_KEY&units=metric"
        )!

        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var forecast: [DayWeather] = []
    
    private let service = WeatherService()

    func loadWeather() async {
        do {
            let response = try await service.fetchWeather()
            forecast = mapToDaily(response)
        } catch {
            print(error)
        }
    }
}

