import Foundation

class WeatherViewModel: WeatherViewModelProtocol {  
    
    var weather: String? {
        didSet {
            self.weatherDidChange?(self)
        }
    }
    let weatherService: Serviceable
    var weatherDidChange: ((WeatherViewModelProtocol) -> ())?
    
    required init(weatherService: Serviceable) {
        self.weatherService = weatherService
    }
    
    @objc func showWeather() {
        weatherService.fetchWeather(for: "721943") { result in
            switch result {
            case .success(let data):
                guard let weatherData = data.consolidated_weather.first else { return }
                
                let temp = round(weatherData.the_temp)
                self.weather = "The weather in \(data.title) is now \(temp)℃"
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
