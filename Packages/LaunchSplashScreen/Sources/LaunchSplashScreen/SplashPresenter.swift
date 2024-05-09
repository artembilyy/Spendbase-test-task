//
//  SplashPresenter.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import UIKit

public protocol SplashPresenterDescription: AnyObject {
    func present()
    func dismiss(completion: @escaping () -> Void)
}

public final class SplashPresenter: SplashPresenterDescription {

    private let scene: UIWindowScene
    private let mainWindow: UIWindow

    public init(scene: UIWindowScene, mainWindow: UIWindow) {
        self.scene = scene
        self.mainWindow = mainWindow
    }

    // MARK: Properties
    private lazy var animator: SplashAnimatorDescription = SplashAnimator(
        mainWindow: mainWindow, foregroundSplashWindow: foregroundSplash,
        backgroundSplashWindow: backgroundSplash)

    private lazy var foregroundSplash: UIWindow = {
        let splashViewController = splashViewController(logoIsHidden: false)
        let splashWindow = splashWindow(windowLevel: .normal + 1, rootViewController: splashViewController)
        return splashWindow
    }()
    private lazy var backgroundSplash: UIWindow = {
        let splashViewController = splashViewController(logoIsHidden: true)
        let splashWindow = splashWindow(windowLevel: .normal - 1, rootViewController: splashViewController)
        return splashWindow
    }()

    // MARK: Helpers

    private func splashWindow(windowLevel: UIWindow.Level, rootViewController: SplashViewController) -> UIWindow {
        let splashWindow = UIWindow(windowScene: scene)
        splashWindow.windowLevel = windowLevel
        splashWindow.rootViewController = rootViewController
        return splashWindow
    }
    private func splashViewController(logoIsHidden: Bool) -> SplashViewController {
        let splashViewController = SplashViewController()
        splashViewController.logoIsHidden = logoIsHidden
        return splashViewController
    }

    // MARK: SplashPresenterDescription

    public func present() {
        animator.animateAppearance()
    }
    public func dismiss(completion: @escaping () -> Void) {
        animator.animateDisappearance(completion: completion)
    }
}
