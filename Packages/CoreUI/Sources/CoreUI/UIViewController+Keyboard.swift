//
//  UIViewController+Keyboard.swift
//
//
//  Created by Artem Bilyi on 11.05.2024.
//

import UIKit

public extension UIViewController {
    func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(dismissKeyboardTap)
    }

    @objc func viewTapped() {
        view.endEditing(true)
    }
}
