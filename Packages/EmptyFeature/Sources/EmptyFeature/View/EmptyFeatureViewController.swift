//
//  EmptyFeatureViewController.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import UIKit

public final class EmptyFeatureViewController: UIViewController {
    
    public enum EmptyFeatureType {
        case transactions
        case myCard
        case account
    }
    
    private var emptyFeatureType: EmptyFeatureType!
    
    func set(emptyFeatureType: EmptyFeatureType) {
        self.emptyFeatureType = emptyFeatureType
    }

    public override func loadView() {
        view = ComingSoonView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if case .myCard = emptyFeatureType {
            addUIBarButtonItem()
        }
    }
    
    private func addUIBarButtonItem() {
        let barButtonItem = UIBarButtonItem(systemItem: .add)
        navigationItem.rightBarButtonItem = barButtonItem
    }
}
