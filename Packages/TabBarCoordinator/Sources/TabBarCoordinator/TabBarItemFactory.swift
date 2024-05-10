//
//  TabBarItemFactory.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

enum TabBarItemFactory {

    enum Tab: String, CaseIterable {
        case home
        case transactions
        case myCards
        case account

        var navigationTitle: String {
            switch self {
            case .transactions, .account:
                return rawValue.capitalized
            case .home:
                return "Money"
            case .myCards:
                return "My cards"
            }
        }

        var title: String {
            switch self {
            case .home, .transactions, .account:
                return rawValue.capitalized
            case .myCards:
                return "my cards".capitalized
            }
        }

        var image: UIImage? {
            switch self {
            case .home:
                return UIImage(resource: .home)
            case .transactions:
                return UIImage(resource: .transactions)
            case .myCards:
                return UIImage(resource: .creditCard)
            case .account:
                return UIImage(resource: .userSquare)
            }
        }

        var tag: Int {
            switch self {
            case .home:
                return 0
            case .transactions:
                return 1
            case .myCards:
                return 2
            case .account:
                return 3
            }
        }
    }

    static func createItem(_ tab: Tab) -> UITabBarItem {
        UITabBarItem(title: tab.title, image: tab.image, tag: tab.tag)
    }
}
