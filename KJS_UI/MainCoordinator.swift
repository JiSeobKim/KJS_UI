//
//  MainCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit


class MainCoordinator: CoordinatorPattern, MainViewControllerCoordinatorListner {
    
    var parent: CoordinatorPattern?
    var childCoordinators: [CoordinatorPattern]
    var navigationController: UINavigationController?
    var presenterViewController: UIViewController?
    var viewController: UIViewController
    
    
    var dragAnimationCoordinator: DragAnimationCoordinator?
    
    required init(
        parent: CoordinatorPattern? = nil,
        navigationController: UINavigationController?,
        presenterViewController: UIViewController?
    ){
        self.parent = parent
        self.childCoordinators = []
        self.navigationController = navigationController
        self.presenterViewController = presenterViewController
        
        self.viewController = UIViewController.makeViewController(
            storyboardName: "Main",
            identifier: "MainVC"
        )
        
        (viewController as? MainViewController)?.coordinatorListener = self
    }
    
    func attachDragAnimationPractice() {
        guard dragAnimationCoordinator == nil else { return }
        dragAnimationCoordinator = DragAnimationCoordinator(
            parent: self,
            navigationController: navigationController,
            presenterViewController: presenterViewController)
    }
    
    func attachDragAnimationBlog() {
        
    }
}

