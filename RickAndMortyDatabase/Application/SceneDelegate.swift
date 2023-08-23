import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
                
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
    }
    
    private func getRootViewController() -> UINavigationController {
        let navigationController = BaseNavigationController()
        navigationController.navigationBar.accessibilityIdentifier = CharacterUIIdentifier.navigationBar.text
        navigationController.navigationItem.leftBarButtonItem?.accessibilityIdentifier = CharacterUIIdentifier.navigationBarBackButton.text
        let navigator = CharactersNavigator(navigationController: navigationController)
        let viewModel = CharactersViewModel(navigator: navigator, client: CharacterClient())
        let controller = CharactersViewController(viewModel: viewModel)
        let filter = UIBarButtonItem(image: RMImageAsset.filter.image, style: .done, target: controller, action: #selector(CharactersViewController.openFilter))
        filter.accessibilityIdentifier = CharacterUIIdentifier.filterNavigationButton.text
        controller.navigationItem.rightBarButtonItem = filter
        controller.navigationItem.largeTitleDisplayMode = .automatic
        navigationController.viewControllers.append(controller)
        return navigationController
    }
}

