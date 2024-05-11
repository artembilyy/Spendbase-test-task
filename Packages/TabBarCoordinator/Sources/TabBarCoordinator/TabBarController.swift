//
//  TabBarController.swift
//  App
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreUI
import UIKit

public final class TabBarController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        viewControllers = [UIViewController()]
        viewControllers = []
        tabBar.tintColor = ThemeColor.vividBlue.asUIColor()
        tabBar.unselectedItemTintColor = ThemeColor.grayishBlue.asUIColor()
    }
}
