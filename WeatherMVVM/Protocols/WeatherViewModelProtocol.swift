import Foundation

protocol WeatherViewModelProtocol: class {
    var weather: String? { get }
    var weatherDidChange: ((WeatherViewModelProtocol) -> ())? { get set }
    
    init(weatherService: Serviceable)
    func showWeather()
}
