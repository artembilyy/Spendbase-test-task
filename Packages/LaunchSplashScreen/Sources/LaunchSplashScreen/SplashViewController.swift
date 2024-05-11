//
//  SplashViewController.swift
//
//
//  Created by Artem Bilyi on 09.05.2024.
//

import UIKit

final class SplashViewController: UIViewController {

    // MARK: Properties

    let logoImageView = UIImageView()
    var logoIsHidden = false
    static let logoImageBig = UIImage(resource: .spendbaselogo)

    // MARK: Style

    private struct Style {
        let logoImageViewSize = CGSize(width: 240, height: 128)
        let logoImageViewCenterPadding = CGFloat(26)
    }

    private let style = Style()

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLogoImageView()
    }

    // MARK: Configure

    private func configureLogoImageView() {
        logoImageView.image = UIImage(resource: .spendbaselogo)
        logoImageView.frame.size = style.logoImageViewSize
        logoImageView.center.x = view.center.x
        logoImageView.center.y = view.center.y - style.logoImageViewCenterPadding
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.isHidden = logoIsHidden
        view.addSubview(logoImageView)
    }
}
