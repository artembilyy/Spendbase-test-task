//
//  TabBarController.swift
//  App
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

public final class TabBarController: UITabBarController {

//    let normalTabBarAttributes: [NSAttributedString.Key: Any] = [
//        .font: UIFont.systemFont(ofSize: 10),
//        .foregroundColor: UIColor.white
//    ]
//    let selectedTabBarAttributes: [NSAttributedString.Key: Any] = [
//        .font: UIFont.systemFont(ofSize: 10),
//        .foregroundColor: UIColor.blue
//    ]

    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        viewControllers = [UIViewController()]
        viewControllers = []
        tabBar.backgroundColor = .white
        tabBar.tintColor = .blue
        tabBar.unselectedItemTintColor = .lightGray
    }
}
