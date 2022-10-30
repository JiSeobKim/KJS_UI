//
//  DiffableDataSourceCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/10/30.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

final class DiffableDataSourceCoordinator: CoordinatorPattern {
    var childCoordinators: [CoordinatorPattern]

    var viewController: UIViewController?

    init() {
        childCoordinators = []
        viewController = DiffableDataSourceCollectionVC()
    }
}
