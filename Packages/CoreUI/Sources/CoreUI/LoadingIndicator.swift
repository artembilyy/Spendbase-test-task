//
//  LoadingIndicator.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

public final class LoadingIndicator: UIView {

    private let indicatorView = UIActivityIndicatorView()

    public enum Size {
        case medium
        case large
    }

    public func install(
        on view: UIView,
        with size: LoadingIndicator.Size) {
        setStyleSize(with: size)

        indicatorView.frame = view.bounds
        indicatorView.color = ThemeColor.softBlue.asUIColor()
        view.addSubview(indicatorView)
    }

    public func startAnimating() {
        indicatorView.startAnimating()
    }

    public func stopAnimating() {
        indicatorView.stopAnimating()
    }

    private func setStyleSize(with size: LoadingIndicator.Size) {
        switch size {
        case .medium:
            indicatorView.style = .medium
        case .large:
            indicatorView.style = .large
        }
    }
}
