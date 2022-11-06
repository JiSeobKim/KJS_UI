//
//  DiffableDataSourceCollectionVM.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/06.
//  Copyright © 2022 JS. All rights reserved.
//

import Foundation
import UIKit

final class DiffableDataSourceCollectionVM {

    private typealias SnapshotType = NSDiffableDataSourceSnapshot<AnyHashable, DiffableDataSourceRowVM>

    private var rowItems: [DiffableDataSourceRowVM] = []
    var dataSource: DiffableDataSourceCollectionDataSource? {
        didSet {
            applyDataSource()
        }
    }
    private var snapshot = SnapshotType()

    init() {
        rowItems = [
            .init(title: "1"),
            .init(title: "2"),
            .init(title: "3"),
        ]
    }

    func addOneElement() {
        let title = String(rowItems.count + 1)
        let new = DiffableDataSourceRowVM(title: title)
        guard let index = (0..<rowItems.count).randomElement() else { return }
        insertElement(vm: new, at: index)
    }

    func addTwoElement() {
        (1...2).forEach { _ in
            addOneElement()
        }
    }

    func updateFirstColor() {
        guard let first = rowItems.first else { return }
        first.updateColor()
        reload(identifiers: [first])
    }

    func updateAllColors() {
        let allItems = snapshot.itemIdentifiers

        allItems.forEach {
            $0.updateColor()
        }
        reload(identifiers: allItems)
    }

    private func applyDataSource() {
        snapshot = SnapshotType()
        snapshot.appendSections([""])
        snapshot.appendItems(rowItems)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }

    private func insertElement(vm: DiffableDataSourceRowVM, at index: Int) {
        guard rowItems.indices ~= index else { return }
        rowItems.insert(vm, at: index)
        applyDataSource()
    }

    private func reload(identifiers: [DiffableDataSourceRowVM]) {
        snapshot.reloadItems(identifiers)
        dataSource?.apply(snapshot)
    }
}

