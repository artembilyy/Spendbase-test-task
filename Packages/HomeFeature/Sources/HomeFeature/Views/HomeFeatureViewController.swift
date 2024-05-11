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

    private let viewModel: HomeFeatureViewModel

    private lazy var tableView = createTableView()
    private var loadingIndicator = LoadingIndicator()

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
        view.backgroundColor = .white

        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(rightBarButtonItemPressed))
        navigationItem.rightBarButtonItem = barButtonItem
    }

    @objc private func rightBarButtonItemPressed() {
        viewModel.rightBarButtonPressed()
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
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 24
        return tableView
    }
}

extension HomeFeatureViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numbersOfSection
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellConfigure(tableView: tableView, indexPath: indexPath)
    }
}
