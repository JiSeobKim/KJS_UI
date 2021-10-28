//
//  MainCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit


class MainCoordinator: CoordinatorPattern, MainViewControllerCoordinatorListener {
    
    var viewController: UIViewController
    
    required init(){
        self.viewController = UIViewController.makeViewController(
            storyboardName: "Main",
            identifier: "MainVC"
        )
        
        if let mainVC = viewController as? MainViewController {
            
            let viewModel = MainViewModel(models: [
                .dragAnimation,
                .dragAnimationForBlog,
                .collectionView,
                .tabBar
            ])
            viewModel.coordinatorListener = self
            mainVC.viewModel = viewModel
        }
    }
    
    func attachDragAnimationPractice() {
        let dragAnimationPracticeCoordinator = DragAnimationPracticeCoordinator()
        self.activeWithPush(viewController: dragAnimationPracticeCoordinator.viewController)
    }
    
    func attachDragAnimationBlog() {
        let dragAnimationBlogCoordinator = DragAnimationBlogCoordinator()
        self.activeWithPush(viewController: dragAnimationBlogCoordinator.viewController)
    }
}

