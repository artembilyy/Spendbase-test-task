//
//  UILabel+ColorText.swift
//
//
//  Created by Artem Bilyi on 11.05.2024.
//

import UIKit

public extension UILabel {

    func setColorToText(targetText: String, color: UIColor) {
        guard let labelText = self.text else {
            return
        }

        let attributedText = NSMutableAttributedString(string: labelText)

        if let range = labelText.range(of: targetText) {
            let nsRange = NSRange(range, in: labelText)
            attributedText.addAttribute(.foregroundColor, value: color, range: nsRange)
        }

        self.attributedText = attributedText
    }
}
