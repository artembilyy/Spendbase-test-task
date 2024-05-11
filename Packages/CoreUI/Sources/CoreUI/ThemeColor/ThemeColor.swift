//
//  ThemeColor.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import Foundation

public enum ThemeColor: UInt, ColorConvertible {

    case white = 0xFFFFFF
    case black = 0x111111
    case darkGrayishBlue = 0x7E8493
    case lightGrayishBlue = 0xF6F7F9
    case limeGreen = 0x00AC4F
    case softBlue = 0xA0CAFD
    case softRed = 0xEC5454
    case vividBlue = 0x1460F3
    case grayishBlue = 0xB3B6BE

    public var hexValue: UInt {
        rawValue
    }
}
