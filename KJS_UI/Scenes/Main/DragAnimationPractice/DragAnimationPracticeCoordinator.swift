//
//  DragAnimationCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

protocol DragAnimationPracticeCoordinatorDelegate {
    func detachDragAnimationPracticeCoordinator()
}

class DragAnimationPracticeCoordinator: CoordinatorPattern {
    
    var childCoordinators: [CoordinatorPattern]
    private var delegate: DragAnimationPracticeCoordinatorDelegate
    
    weak var viewController: UIViewController?
    
    required init(delegate: DragAnimationPracticeCoordinatorDelegate) {
        self.delegate = delegate
        self.childCoordinators = []
        self.viewController = UIViewController.makeViewController(storyboardName: "Main", identifier: "DragAnimationVC")
    }
}
