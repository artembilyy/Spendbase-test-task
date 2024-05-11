//
//  UITableView+Register.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

public extension UITableView {

    func registerCell<T: UITableViewCell>(_: T.Type, identifier: String? = nil) {
        let identifier = identifier ?? T.identifier
        register(T.self, forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue cell with identifie: \(T.identifier)")
        }
        return cell
    }
}
