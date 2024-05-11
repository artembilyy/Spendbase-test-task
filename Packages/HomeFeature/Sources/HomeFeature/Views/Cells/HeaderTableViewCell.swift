//
//  HeaderTableViewCell.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

final class HeaderTableViewCell: UITableViewCell {

    private enum Strings: String {
        case buttonTitle = "See all"
    }

    private let nameLabel = UILabel()
    private let button = UIButton()

    private struct Style {
        let nameLabelFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
        let nameLabelTextColor = UIColor.black
        let buttonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let buttonTitleColor = UIColor.systemBlue
        let nameLabelLeftPadding: CGFloat = 16
        let nameLabelTopPadding: CGFloat = 13
        let nameLabelBottomPadding: CGFloat = -9
        let buttonRightPadding: CGFloat = -16
    }

    private let style = Style()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureNameLabel()
        configureButton()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String) {
        nameLabel.text = title
    }

    private func configureNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = style.nameLabelFont
        nameLabel.textColor = style.nameLabelTextColor
        addSubview(nameLabel)
    }

    private func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Strings.buttonTitle.rawValue, for: .normal)
        button.titleLabel?.font = style.buttonFont
        button.setTitleColor(style.buttonTitleColor, for: .normal)
        addSubview(button)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: style.nameLabelLeftPadding),
            nameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: style.nameLabelTopPadding),
            nameLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: style.nameLabelBottomPadding),

            button.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: style.buttonRightPadding),
            button.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])
    }
}
