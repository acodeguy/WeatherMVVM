import UIKit

class WeatherViewController: UIViewController {
    
    let weatherLabel = UILabel()
    let button = UIButton()
    var viewModel: WeatherViewModelProtocol! {
        didSet {
            self.viewModel.weatherDidChange = { [unowned self] viewModel in
                DispatchQueue.main.async {
                    self.weatherLabel.text = viewModel.weather
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.textColor = .black
        view.addSubview(weatherLabel)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Refresh", for: .normal)
        button.backgroundColor = .black
        button.addTarget(viewModel, action: "showWeather", for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            weatherLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
        viewModel.showWeather()
    }
}
