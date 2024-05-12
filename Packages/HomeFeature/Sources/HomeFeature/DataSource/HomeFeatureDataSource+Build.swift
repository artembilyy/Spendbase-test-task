//
//  HomeFeatureDataSource.swift
//
//
//  Created by Artem Bilyi on 12.05.2024.
//

import UIKit

extension HomeFeatureDataSource {
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard
            let viewModel,
            section < viewModel.sectionTypes.count
        else {
            return 0
        }
        
        let sectionType = viewModel.sectionTypes[section]
        switch sectionType {
        case .cardBalance:
            return viewModel.cardBalance?.balance != nil ? 1 : 0
        case .cardsResponse:
            return (viewModel.cardsResponse?.cards.count ?? 0) + 1
        case .transactionsResponse:
            return (viewModel.transactionsResponse?.transactions.count ?? 0) + 1
        }
    }
    
    func cellConfigure(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel else { return UITableViewCell() }
        let header: HeaderTableViewCell = tableView.dequeueReusableCell()
        
        let sectionType = viewModel.sectionTypes[indexPath.section]
        
        switch sectionType {
        case .cardBalance:
            let cell: TopTableViewCell = tableView.dequeueReusableCell()
            cell.configure(balance: viewModel.cardBalance)
            return cell
        case .cardsResponse:
            if indexPath.item == 0 {
                header.configure(title: sectionType.title)
                return header
            }
            let cell: CardTableViewCell = tableView.dequeueReusableCell()
            cell.configure(card: viewModel.cardsResponse?.cards[indexPath.row - 1])
            return cell
        case .transactionsResponse:
            if indexPath.item == 0 {
                header.configure(title: sectionType.title)
                return header
            }
            let cell: TransactionTableViewCell = tableView.dequeueReusableCell()
            cell.configure(transaction: viewModel.transactionsResponse?.transactions[indexPath.row - 1])
            return cell
        }
    }
}
