//
//  CardTableViewCell.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit
import UserCardsAPI

final class CardTableViewCell: UITableViewCell {

    private struct Style {
        let nameLabelFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let nameLabelTextColor = UIColor.black
        let nameLabelRightPadding: CGFloat = -16
        let nameLabelLeftPadding: CGFloat = 12
        let cardImageViewTopPadding: CGFloat = 12
        let cardImageViewBottomPadding: CGFloat = -12
        let cardImageViewLeftPadding: CGFloat = 16
    }

    private let cardImageView = UIImageView()
    private let nameLabel = UILabel()

    private let style = Style()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureCardImageView()
        configureNameLabel()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(card: CardsModel.Card?) {
        nameLabel.text = card?.cardName
    }

    private func configureCardImageView() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(resource: .creditCard)
        addSubview(cardImageView)
    }

    private func configureNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = style.nameLabelFont
        nameLabel.textColor = style.nameLabelTextColor
        addSubview(nameLabel)
    }

    private func setupConstraints() {
        let nameLabelTrailingAnchorConstraint = nameLabel.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: style.nameLabelRightPadding)
        nameLabelTrailingAnchorConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: style.cardImageViewTopPadding),
            cardImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: style.cardImageViewBottomPadding),
            cardImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: style.cardImageViewLeftPadding),
            nameLabel.leadingAnchor.constraint(
                equalTo: cardImageView.trailingAnchor,
                constant: style.nameLabelLeftPadding),
            nameLabel.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor),
            nameLabelTrailingAnchorConstraint
        ])
    }
}
