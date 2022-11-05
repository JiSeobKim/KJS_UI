//
//  MainDiffableDataSource.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/06.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

final class MainDiffableDataSource: UITableViewDiffableDataSource<MainSection, MainRow> {

    static func make(cellID: String, tableView: UITableView) -> MainDiffableDataSource {
        return .init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = itemIdentifier.title
            content.textProperties.font = .preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = content
            cell.selectionStyle = .none
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section =  snapshot().sectionIdentifiers[safe: section]
        return section?.title
    }
}
