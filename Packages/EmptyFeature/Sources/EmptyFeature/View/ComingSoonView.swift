//
//  ComingSoonView.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

final class ComingSoonView: UIView {

    private enum Text: String {
        case comingSoon = "Coming soon"
    }

    private struct Style {
        let stackViewSize = CGSize(width: 91, height: 108)
        let logoImageViewSize = CGSize(width: 80, height: 80)
        let labelFont = UIFont.preferredFont(forTextStyle: .subheadline).withSize(15)
    }

    private let stackView = UIStackView()
    private let logoImageView = UIImageView()
    private let label = UILabel()

    private let style = Style()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 246 / 255, green: 247 / 255, blue: 249 / 255, alpha: 1)

        configureStackView()
        configureLogoView()
        configureLabel()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.center = center
    }

    private func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.frame.size = style.stackViewSize
        addSubview(stackView)
    }

    private func configureLogoView() {
        logoImageView.image = UIImage(resource: .graylogo)
        logoImageView.frame.size = style.logoImageViewSize
        logoImageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(logoImageView)
    }

    private func configureLabel() {
        label.textColor = UIColor(red: 179 / 255, green: 182 / 255, blue: 190 / 255, alpha: 1)
        label.font = style.labelFont
        label.text = Text.comingSoon.rawValue
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
    }
}
