//
//  TransactionTableViewCell.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CoreUI
import UIKit

final class TransactionTableViewCell: UITableViewCell {

    private struct Layout {
        let amountLabelLeftPadding: CGFloat = -12
        let circleViewBottomConstant: CGFloat = -8
        let circleViewHeightConstant: CGFloat = 40
        let circleViewInnerSpacingConstant: CGFloat = 8
        let circleViewLeadingConstant: CGFloat = 16
        let circleViewTopConstant: CGFloat = 8
        let circleViewTrailingConstant: CGFloat = -16
        let failedViewBottomConstant: CGFloat = 0.5
        let failedViewHeightConstant: CGFloat = 12
    }

    private struct Style {
        let amountLabelFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        let amountLabelTextColor = ThemeColor.darkGrayishBlue.asUIColor()
        let cardNumberLabelFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        let cardNumberLabelTextColor = ThemeColor.darkGrayishBlue.asUIColor()
        let circleViewColor = ThemeColor.lightGrayishBlue.asUIColor()
        let circleViewCornerRadius: CGFloat = 20
        let failedViewColor = ThemeColor.softRed.asUIColor()
        let failedViewCornderRadius: CGFloat = 6
        let nameLabelFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let nameLabelTextColor = ThemeColor.black.asUIColor()
        let rightStackViewSpasing: CGFloat = 8
    }

    private let amountLabel = UILabel()
    private let attachmentsImageView = UIImageView()
    private let cardNumberLabel = UILabel()
    private let circleView = UIView()
    private let failedView = UIView()
    private let leftStackView = UIStackView()
    private let nameLabel = UILabel()
    private let rightStackView = UIStackView()
    private let transactionImageView = UIImageView()

    private let layout = Layout()
    private let style = Style()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {}

    private func setupUI() {
        selectionStyle = .none
        configureCircleView()
        configureTransactionImageView()
        configureFailedView()
        configureAmountLabel()
        configureLeftStackView()
        configureRightStackView()
        configureNameLabel()
        configureCardNumberLabel()
        configureAttachmentsImageView()
    }

    private func configureTransactionImageView() {
        transactionImageView.translatesAutoresizingMaskIntoConstraints = false
        transactionImageView.image = UIImage(resource: .card)
        addSubview(transactionImageView)
    }

    private func configureCircleView() {
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.layer.cornerRadius = style.circleViewCornerRadius
        circleView.backgroundColor = style.circleViewColor
        addSubview(circleView)
    }

    private func configureFailedView() {
        failedView.translatesAutoresizingMaskIntoConstraints = false
        failedView.layer.cornerRadius = style.failedViewCornderRadius
        failedView.backgroundColor = style.failedViewColor
        addSubview(failedView)
    }

    private func configureNameLabel() {
        nameLabel.text = "Load"
        nameLabel.font = style.nameLabelFont
        nameLabel.textColor = style.nameLabelTextColor
    }

    private func configureCardNumberLabel() {
        cardNumberLabel.text = "•• 7544"
        cardNumberLabel.font = style.cardNumberLabelFont
        cardNumberLabel.textColor = style.cardNumberLabelTextColor
    }

    private func configureLeftStackView() {
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.axis = .vertical
        leftStackView.alignment = .leading
        addSubview(leftStackView)
        leftStackView.addArrangedSubview(nameLabel)
        leftStackView.addArrangedSubview(cardNumberLabel)
    }

    private func configureRightStackView() {
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.axis = .horizontal
        rightStackView.spacing = style.rightStackViewSpasing
        addSubview(rightStackView)
        rightStackView.addArrangedSubview(amountLabel)
        rightStackView.addArrangedSubview(attachmentsImageView)
    }

    private func configureAmountLabel() {
        amountLabel.text = "€1000"
        amountLabel.font = style.amountLabelFont
        amountLabel.textColor = style.amountLabelTextColor
        addSubview(amountLabel)
    }

    private func configureAttachmentsImageView() {
        attachmentsImageView.image = UIImage(resource: .attachments)
    }

    private func setupConstraints() {
        let leftStackViewTrailingAnchorConstraint = leftStackView.trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: layout.amountLabelLeftPadding)
        leftStackViewTrailingAnchorConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: layout.circleViewTopConstant),
            circleView.heightAnchor.constraint(equalToConstant: layout.circleViewHeightConstant),
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),

            failedView.heightAnchor.constraint(equalToConstant: layout.failedViewHeightConstant),
            failedView.widthAnchor.constraint(equalTo: failedView.heightAnchor),
            failedView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: layout.failedViewBottomConstant),
            failedView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor),

            circleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: layout.circleViewLeadingConstant),

            transactionImageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            transactionImageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),

            leftStackView.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: layout.circleViewInnerSpacingConstant),
            leftStackView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            leftStackViewTrailingAnchorConstraint,

            rightStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: layout.circleViewTrailingConstant),
            rightStackView.centerYAnchor.constraint(equalTo: leftStackView.centerYAnchor),

            circleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: layout.circleViewBottomConstant)
        ])
    }
}
