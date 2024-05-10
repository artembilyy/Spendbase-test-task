//
//  TransferViewController.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

final class TransferViewController: UIViewController {

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 12
        return stackView
    }()

    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "You have €1,000,47\navailable in your balance"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()

    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "€"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0"
        textField.keyboardType = .numberPad
        textField.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        textField.textColor = .lightGray
        return textField
    }()

    private let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 24
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Transfer"
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cross"), style: .done, target: self, action: #selector(crossButtonPressed))

        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(bottomLabel)
        horizontalStackView.addArrangedSubview(topLabel)
        horizontalStackView.addArrangedSubview(textField)
        view.addSubview(verticalStackView)
        view.addSubview(continueButton)

        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: view.widthAnchor),

            continueButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 88),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc private func crossButtonPressed() {
        dismiss(animated: true)
    }
}
