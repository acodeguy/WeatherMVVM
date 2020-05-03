import Foundation

struct WeatherData: Codable {
    let consolidated_weather: [Weather]
    let title: String
}
