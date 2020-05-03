import Foundation

class WeatherService: Serviceable {
    
    static let shared = WeatherService()
    
    private let weatherAPIURL = "https://www.metaweather.com/api/location"
    
    func fetchWeather(for woeid: String = "721943",completion: @escaping (Result<WeatherData, Error>) -> Void) {
        
        let url = URL(string: "\(weatherAPIURL)/\(woeid)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }

            do {
                let weather = try JSONDecoder().decode(WeatherData.self, from: validData)
                completion(.success(weather))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
        }.resume()
    }
}
