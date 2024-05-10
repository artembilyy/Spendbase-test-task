//
//  TopTableViewCell.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit
import UserCardsAPI

final class TopTableViewCell: UITableViewCell {

    private let currencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(resource: .euro)
        return imageView
    }()

    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EUR account"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(currencyLabel)
        addSubview(currencyImageView)
        addSubview(amountLabel)

        NSLayoutConstraint.activate([
            currencyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            currencyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            currencyImageView.topAnchor.constraint(equalTo: currencyLabel.topAnchor),
            currencyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            currencyLabel.leadingAnchor.constraint(equalTo: currencyImageView.trailingAnchor, constant: 8),

            amountLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 4),
            amountLabel.leadingAnchor.constraint(equalTo: currencyImageView.leadingAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: currencyLabel.trailingAnchor),
            amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(balance: CardBalanceModel?) {
        amountLabel.text = balance?.balanceFormatted
    }
}
