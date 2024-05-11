//
//  EmptyFeatureViewController.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

final class EmptyFeatureViewController: UIViewController {

    override func loadView() {
        view = ComingSoonView()
    }
}
