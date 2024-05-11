//
//  MoneyTransferViewController.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import CardDataStorage
import Combine
import CoreUI
import UIKit

final class MoneyTransferViewController: UIViewController {

    private enum Strings {
        case title
        case continueButtonTitle
        case textFieldPlaceholder
        case topLabelTitle
        case bottomLabelText(String)

        var rawValue: String {
            switch self {
            case .title:
                return "Transfer"
            case .continueButtonTitle:
                return "Continue"
            case .textFieldPlaceholder:
                return "0"
            case .topLabelTitle:
                return "€"
            case .bottomLabelText(let string):
                return "You have \(string)\navailable in your balance"
            }
        }
    }

    private struct Layout {
        let continueButtonTopOffset: CGFloat = 88
        let continueButtonLeadingOffset: CGFloat = 16
        let continueButtonTrailingOffset: CGFloat = -16
        let continueButtonHeight: CGFloat = 48
        let verticalStackViewTopOffset: CGFloat = 160
    }

    private struct Style {
        let verticalStackViewSpasing: CGFloat = 12
        let horizontalStackViewSpasing: CGFloat = 8
        let bottomLabelFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        let topLabelFont = UIFont.systemFont(ofSize: 34, weight: .bold)
        let continueButtonCornerRadius: CGFloat = 24
        let continueButtonFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        let bottomLabelTextColor = ThemeColor.grayishBlue.asUIColor()
        let topLabelTextColor = ThemeColor.black.asUIColor()
        let textFieldPlaceholderTextColor = ThemeColor.grayishBlue.asUIColor()
        let textFieldTextColor = ThemeColor.black.asUIColor()
        let continueButtonTitleLabelTextColor = ThemeColor.white.asUIColor()
        let continueButtonBackgroundColor = ThemeColor.softBlue.asUIColor()
        let continueButtonActiveBackgroundColor = ThemeColor.vividBlue.asUIColor()
        let viewBackgroundColor = ThemeColor.white.asUIColor()
    }

    private let layout = Layout()
    private let style = Style()

    private let verticalStackView = UIStackView()
    private let horizontalStackView = UIStackView()
    private let bottomLabel = UILabel()
    private let textField = UITextField()
    private let topLabel = UILabel()
    private let continueButton = UIButton()

    private let viewModel: MoneyTransferViewModel

    init(viewModel: MoneyTransferViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        setupUI()
        setupConstraints()
        bindings()
        setupDismissKeyboardGesture()
    }

    private func bindings() {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: textField)
            .map({ ($0.object as! UITextField).text ?? "" })
            .sink { [unowned self] text in
                viewModel.subjectTextFieldText.send(text)
                textField.sizeToFit()
                horizontalStackView.sizeToFit()
            }
            .store(in: &subscriptions)

        viewModel
            .isTextValid
            .removeDuplicates()
            .sink { [unowned self] status in
                switch status {
                case .empty:
                    bottomLabel.textColor = style.bottomLabelTextColor
                    bottomLabel.setColorToText(targetText: viewModel.currentBalance, color: .black)
                    continueButton.backgroundColor = style.continueButtonBackgroundColor
                    continueButton.isEnabled = false
                case .valid:
                    bottomLabel.textColor = style.bottomLabelTextColor
                    bottomLabel.setColorToText(targetText: viewModel.currentBalance, color: .black)
                    continueButton.isEnabled = true
                    continueButton.backgroundColor = style.continueButtonActiveBackgroundColor
                case .invalid:
                    bottomLabel.textColor = ThemeColor.softRed.asUIColor()
                    continueButton.isEnabled = false
                    continueButton.backgroundColor = style.continueButtonBackgroundColor
                }
            }
            .store(in: &subscriptions)
    }

    private func configureVerticalStackView() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .center
        verticalStackView.spacing = style.verticalStackViewSpasing
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(bottomLabel)
    }

    private func configureHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = style.horizontalStackViewSpasing
        horizontalStackView.addArrangedSubview(topLabel)
        horizontalStackView.addArrangedSubview(textField)
    }

    private func configureBottomLabel() {
        bottomLabel.text = Strings.bottomLabelText(viewModel.currentBalance).rawValue
        bottomLabel.font = style.bottomLabelFont
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
    }

    private func configureTopLabel() {
        topLabel.text = String(viewModel.currentBalance.first ?? Character(Strings.topLabelTitle.rawValue))
        topLabel.font = style.topLabelFont
        topLabel.textColor = style.topLabelTextColor
    }

    private func configureTextFiled() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: style.textFieldPlaceholderTextColor
        ]
        let attributedPlaceholder = NSAttributedString(string: Strings.textFieldPlaceholder.rawValue, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.keyboardType = .decimalPad
        textField.font = style.topLabelFont
        textField.textColor = style.textFieldTextColor

    }

    private func configureCTAButton() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle(Strings.continueButtonTitle.rawValue, for: .normal)
        continueButton.layer.cornerRadius = style.continueButtonCornerRadius
        continueButton.titleLabel?.textColor = style.continueButtonTitleLabelTextColor
        continueButton.titleLabel?.font = style.continueButtonFont
        continueButton.addAction(createButtonAction(), for: .touchUpInside)
        view.addSubview(continueButton)
    }

    private func createButtonAction() -> UIAction {
        UIAction { [unowned self] _ in
            viewModel.ctaButtonPressed()
        }
    }

    private func setupUI() {
        configureVerticalStackView()
        configureHorizontalStackView()
        configureBottomLabel()
        configureTopLabel()
        configureTextFiled()
        configureCTAButton()
    }

    private func configureVC() {
        title = Strings.title.rawValue
        view.backgroundColor = ThemeColor.white.asUIColor()
        let crossImage = UIImage(resource: .cross)
        let barButtonItem = UIBarButtonItem(
            image: crossImage,
            style: .done,
            target: self,
            action: #selector(crossButtonPressed))
        navigationItem.rightBarButtonItem = barButtonItem
    }

    @objc
    private func crossButtonPressed() {
        viewModel.crossButtonpressed()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: layout.verticalStackViewTopOffset),
            verticalStackView.leadingAnchor.constraint(
                equalTo: continueButton.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(
                equalTo: continueButton.trailingAnchor),

            continueButton.topAnchor.constraint(
                equalTo: verticalStackView.bottomAnchor,
                constant: layout.continueButtonTopOffset),
            continueButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: layout.continueButtonLeadingOffset),
            continueButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: layout.continueButtonTrailingOffset),
            continueButton.heightAnchor.constraint(equalToConstant: layout.continueButtonHeight)
        ])
    }
}
