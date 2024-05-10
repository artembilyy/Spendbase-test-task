//
//  SceneDelegate.swift
//  Spendbase
//
//  Created by Artem Bilyi on 09.05.2024.
//

import LaunchSplashScreen
import TabBarCoordinator
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var splashPresenter: SplashPresenterDescription!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        launchAppWithSplashScreen(scene: windowScene, window: window)

        self.window = window

        let tabBarCoordinator = TabBarCoordinator()
        tabBarCoordinator.start()

        self.window?.rootViewController = tabBarCoordinator.tabBarController
        self.window?.makeKeyAndVisible()
    }

    private func launchAppWithSplashScreen(scene: UIWindowScene, window: UIWindow) {
        splashPresenter = SplashPresenter(scene: scene, mainWindow: window)
        splashPresenter.present()

        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            splashPresenter.dismiss { [unowned self] in
                splashPresenter = nil
            }
        }
    }
}

extension SceneDelegate {
    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
