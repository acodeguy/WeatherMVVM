import Foundation

protocol Serviceable {
    func fetchWeather(for woeid: String, completion: @escaping (Result<WeatherData, Error>) -> Void)
}
