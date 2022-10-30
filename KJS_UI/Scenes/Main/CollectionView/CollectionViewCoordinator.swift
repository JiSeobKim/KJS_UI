//
//  CollectionViewCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/29.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

class CollectionViewCoordinator: CoordinatorPattern, CollectionViewCoordinatorListener {

    var childCoordinators: [CoordinatorPattern]
    weak var viewController: UIViewController?
    
    init() {
        self.childCoordinators = []
        
        let vc = CollectionViewViewController()
        self.viewController = vc
        
        if let vc = viewController as? CollectionViewViewController {
            let viewModel = CollectionViewViewModel(coordinatorListener: self)
            vc.viewModel = viewModel
        }
    }
    
    func attachHeaderAutoLayoutCollection() {
        let coordinator = HeaderAutoLayoutCollectionCoordinator()
        let vc = coordinator.viewController
        childCoordinators.append(coordinator)
        activeWithPush(viewController: vc)
    }

    func attachDiffableDataSource() {
        let coordinator = DiffableDataSourceCoordinator()
        let vc = coordinator.viewController
        childCoordinators.append(coordinator)
        activeWithPush(viewController: vc)
    }
}
