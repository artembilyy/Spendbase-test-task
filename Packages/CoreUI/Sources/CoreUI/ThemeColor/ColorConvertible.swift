//
//  ColorConvertible.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

public protocol ColorConvertible {
    var hexValue: UInt { get }
    func asUIColor() -> UIColor
    func asCGColor() -> CGColor
}

public extension ColorConvertible {
    private var hexString: String {
        String(format: "%06X", hexValue)
    }

    func asUIColor() -> UIColor {
        UIColor(hex: hexString)
    }

    func asUIColor(alpha: CGFloat) -> UIColor {
        asUIColor().withAlphaComponent(alpha)
    }

    func asCGColor() -> CGColor {
        asUIColor().cgColor
    }
}
