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
        view.addSubview(tableView)
        view.backgroundColor = .white
        bindings()
        viewModel.fetchAllData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadingIndicator.install(on: tableView, with: .large)

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
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if viewModel.cardBalance?.balance != nil {
                return 1
            }
        case 1:
            if let cards = viewModel.cardsResponse?.cards {
                return cards.count + 1
            }
        case 2:
            if let transactions = viewModel.transactionsResponse?.transactions {
                return transactions.count + 1
            }
        default:
            return 0
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let header: HeaderTableViewCell = tableView.dequeueReusableCell()
        switch indexPath.section {
        case 0:
            let cell: TopTableViewCell = tableView.dequeueReusableCell()
            cell.configure(balance: viewModel.cardBalance)
            return cell
        case 1:
            if indexPath.item == 0 {
                header.configure(title: "My cards")
                return header
            }
            let cell: CardTableViewCell = tableView.dequeueReusableCell()
            return cell
        case 2:
            if indexPath.item == 0 {
                header.configure(title: "Recent transactions")
                return header
            }
            let cell: TransactionTableViewCell = tableView.dequeueReusableCell()
            return cell
        default:
            return UITableViewCell()
        }
    }
}
