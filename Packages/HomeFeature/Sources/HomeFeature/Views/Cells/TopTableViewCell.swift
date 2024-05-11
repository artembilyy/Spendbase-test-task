//
//  TopTableViewCell.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreUI
import UIKit
import UserCardsAPI

final class TopTableViewCell: UITableViewCell {

    private enum Strings: String {
        case currencyLabelText = "EUR account"
    }

    private struct Style {
        let currencyLabelFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let currencyLabelTextColor = ThemeColor.grayishBlue.asUIColor()
        let amountLabelFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        let amountLabelTextColor = ThemeColor.black.asUIColor()
    }

    private let style = Style()

    private struct Layout {
        let currencyLabelTopPadding: CGFloat = 8
        let currencyLabelLeftPadding: CGFloat = 8
        let currencyLabelRightPadding: CGFloat = -16
        let currencyImageViewLeftPadding: CGFloat = 16
        let amountLabelTopPadding: CGFloat = 4
        let amountLabelBottomPadding: CGFloat = -8
    }

    private let layout = Layout()

    private let amountLabel = UILabel()
    private let currencyLabel = UILabel()
    private let currencyImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(balance: CardBalanceModel?) {
        amountLabel.text = CardBalanceValueFactory.configure(cardBalance: balance)
    }

    private func setupUI() {
        selectionStyle = .none
        configureCurrencyLabel()
        configureAmountLabel()
        configureCurrencyImageView()
    }

    private func configureCurrencyImageView() {
        currencyImageView.translatesAutoresizingMaskIntoConstraints = false
        currencyImageView.image = UIImage(resource: .euro)
        addSubview(currencyImageView)
    }

    private func configureCurrencyLabel() {
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.text = Strings.currencyLabelText.rawValue
        currencyLabel.font = style.currencyLabelFont
        currencyLabel.textColor = style.currencyLabelTextColor
        addSubview(currencyLabel)
    }

    private func configureAmountLabel() {
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = style.amountLabelFont
        amountLabel.textColor = style.amountLabelTextColor
        addSubview(amountLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: layout.currencyLabelTopPadding),
            currencyLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: layout.currencyLabelRightPadding),

            currencyImageView.topAnchor.constraint(
                equalTo: currencyLabel.topAnchor),
            currencyImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: layout.currencyImageViewLeftPadding),
            currencyLabel.leadingAnchor.constraint(
                equalTo: currencyImageView.trailingAnchor,
                constant: layout.currencyLabelLeftPadding),

            amountLabel.topAnchor.constraint(
                equalTo: currencyLabel.bottomAnchor,
                constant: layout.amountLabelTopPadding),
            amountLabel.leadingAnchor.constraint(
                equalTo: currencyImageView.leadingAnchor),
            amountLabel.trailingAnchor.constraint(
                equalTo: currencyLabel.trailingAnchor),
            amountLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: layout.amountLabelBottomPadding)
        ])
    }

}
