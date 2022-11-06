//
//  DiffableDataSourceRowVM.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/06.
//  Copyright © 2022 JS. All rights reserved.
//

import Foundation
import UIKit

final class DiffableDataSourceRowVM: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    static func == (lhs: DiffableDataSourceRowVM, rhs: DiffableDataSourceRowVM) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    let title: String
    var color: UIColor

    private let uuid = UUID()

    init(title: String, color: UIColor = .randomColor) {
        self.title = title
        self.color = color
    }

    func updateColor(color: UIColor = .randomColor) {
        self.color = color
    }
}
