//
//  HomeFeatureDataSource.swift
//
//
//  Created by Artem Bilyi on 12.05.2024.
//

import UIKit

final class HomeFeatureDataSource: NSObject {

    weak var viewModel: HomeFeatureViewModel?
    
    init(viewModel: HomeFeatureViewModel) {
        self.viewModel = viewModel
    }
}

extension HomeFeatureDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sectionTypes.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellConfigure(tableView: tableView, indexPath: indexPath)
    }
}
