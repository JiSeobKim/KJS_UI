//
//  DragAnimationCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

class DragAnimationPracticeCoordinator: CoordinatorPattern {
    
    var parent: CoordinatorPattern?
    var childCoordinators: [CoordinatorPattern]
    var navigationController: UINavigationController?
    var presenterViewController: UIViewController?
    var viewController: UIViewController
    
    required init(
        parent: CoordinatorPattern?,
        navigationController: UINavigationController?,
        presenterViewController: UIViewController?
    ) {
        self.childCoordinators = []
        self.navigationController = navigationController
        self.presenterViewController = presenterViewController
        self.viewController = UIViewController.makeViewController(storyboardName: "Main", identifier: "DragAnimationVC")
    }
}
