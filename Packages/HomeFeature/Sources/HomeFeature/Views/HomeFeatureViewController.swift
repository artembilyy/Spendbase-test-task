//
//  HomeFeatureViewController.swift
//
//
//  Created by Artem Bilyi on 10.05.2024.
//

import Combine
import CoreUI
import UIKit

final class HomeFeatureViewController: UIViewController {
    
    private struct Style {
        let sectionHeaderHeight: CGFloat = 0
        let sectionFooterHeight: CGFloat = 24
        let backgroundColor = ThemeColor.lightGrayishBlue.asUIColor()
    }
    
    private let style = Style()
    
    private lazy var tableView = createTableView()
    private let loadingIndicator = LoadingIndicator()
    
    private let viewModel: HomeFeatureViewModel

    private var subscriptions = Set<AnyCancellable>()

    init(viewModel: HomeFeatureViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindings()
        viewModel.fetchAllData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadingIndicator.install(on: tableView, with: .large)

    }

    private func setupUI() {
        view.addSubview(tableView)
        view.backgroundColor = style.backgroundColor

        let barButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: rightBarButtonItemPressed())
        navigationItem.rightBarButtonItem = barButtonItem
    }

    private func rightBarButtonItemPressed() -> UIAction {
        UIAction { [unowned self] _ in
            viewModel.rightBarButtonPressed()
        }
    }

    private func bindings() {
        viewModel
            .loadingState
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] state in
                switch state {
                case .start:
                    loadingIndicator.startAnimating()
                case .success:
                    loadingIndicator.stopAnimating()
                    tableView.reloadData()
                case .failure(let error):
                    print("Error: - \(error.localizedDescription)")
                    loadingIndicator.stopAnimating()
                }
            }
            .store(in: &subscriptions)
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.registerCell(TopTableViewCell.self)
        tableView.registerCell(CardTableViewCell.self)
        tableView.registerCell(HeaderTableViewCell.self)
        tableView.registerCell(TransactionTableViewCell.self)
        tableView.dataSource = viewModel.dataSource
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = style.sectionHeaderHeight
        tableView.sectionFooterHeight = style.sectionFooterHeight
        tableView.backgroundColor = style.backgroundColor
        return tableView
    }
}
