//
//  MoneyTransferViewModel.swift
//
//
//  Created by Artem Bilyi on 11.05.2024.
//

import CardDataStorage
import Combine
import CoreUI
import Foundation
import UserCardsAPI

public final class MoneyTransferViewModel {

    public typealias Dependencies = CardDataStorageContainer

    enum TextFieldStatus {
        case empty
        case valid
        case invalid
    }

    private(set) var subjectTextFieldText = CurrentValueSubject<String, Never>("")

    private let subjectCrossButtonInteraction = PassthroughSubject<Void, Never>()
    private let subjectCTAButtonInteraction = PassthroughSubject<Void, Never>()

    private var cardBalance: CardBalanceModel? {
        dependencies
            .cardDataStorage
            .userBalance
    }

    var currentBalance: String {
        CardBalanceValueFactory.configure(cardBalance: cardBalance)
    }

    var isTextValid: AnyPublisher<TextFieldStatus, Never> {
        subjectTextFieldText
            .map { [unowned self] value in
                validateTextField(value)
            }
            .eraseToAnyPublisher()
    }

    var crossButtonInteractionObservable: AnyPublisher<Void, Never> {
        subjectCrossButtonInteraction.eraseToAnyPublisher()
    }

    var ctaButtonInteractionObservable: AnyPublisher<Void, Never> {
        subjectCTAButtonInteraction.eraseToAnyPublisher()
    }
    private var dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func ctaButtonPressed() {
        subjectCTAButtonInteraction.send()
    }

    func crossButtonpressed() {
        subjectCrossButtonInteraction.send()
    }

    private func validateTextField(_ value: String) -> TextFieldStatus {
        if value.isEmpty {
            return .empty
        }
        guard
            let sum = Double(value.replacingOccurrences(of: ",", with: ".")),
            let balance = self.cardBalance?.balance
        else {
            return .invalid
        }
        if sum <= balance {
            return .valid
        }
        return .invalid
    }
}
