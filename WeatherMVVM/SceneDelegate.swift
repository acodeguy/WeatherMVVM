import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let service = WeatherService()
        let viewModel = WeatherViewModel(weatherService: service)
        let view = WeatherViewController()
        view.viewModel = viewModel
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = view
        self.window = window
        window.makeKeyAndVisible()
    }
}

