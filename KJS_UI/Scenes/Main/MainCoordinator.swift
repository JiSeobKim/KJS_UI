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
    
    var childCoordinators: [CoordinatorPattern]
    weak var viewController: UIViewController?
    
    
    private var dragAnimationPracticeCoordinator: DragAnimationPracticeCoordinator?
    
    
    required init(){
        self.childCoordinators = []

        let sections: [MainSection] = [
            .uikit(rows: [
                .collectionView,
                .tabBar
            ]),
            .experiment(rows: [
                .dragAnimation,
                .dragAnimationForBlog
            ])
        ]
        let mainViewModel = MainViewModel(sections: sections)
        let mainVC = MainViewController(viewModel: mainViewModel)
        mainViewModel.coordinatorListener = self
        self.viewController = mainVC
    }
    
    func detachMainView() {
        
    }
    
    func attachDragAnimationPractice() {
        let dragAnimationPracticeCoordinator = DragAnimationPracticeCoordinator(delegate: self)
        childCoordinators.append(dragAnimationPracticeCoordinator)
        self.dragAnimationPracticeCoordinator = dragAnimationPracticeCoordinator
        self.activeWithPush(viewController: dragAnimationPracticeCoordinator.viewController)
    }
    
    func attachDragAnimationBlog() {
        let dragAnimationBlogCoordinator = DragAnimationBlogCoordinator()
        childCoordinators.append(dragAnimationBlogCoordinator)
        self.activeWithPush(viewController: dragAnimationBlogCoordinator.viewController)
    }
    
    func attachCollectionView() {
        let collectionViewCoordinator = CollectionViewCoordinator()
        childCoordinators.append(collectionViewCoordinator)
        self.activeWithPush(viewController: collectionViewCoordinator.viewController)
    }
    
    func attachTabBarViewController() {
        let coordinator = TabBarCoordinator()
        childCoordinators.append(coordinator)
        activeWithPush(viewController: coordinator.viewController)
    }
}


extension MainCoordinator: DragAnimationPracticeCoordinatorDelegate {
    func detachDragAnimationPracticeCoordinator() {
//        dragAnimationPracticeCoordinator.map{ coordinator in
//            let index = childCoordinators.last(where: {$0 is DragAnimationPracticeCoordinator})
//            index
//        }
//
//        childCoordinators.removeAll(where: {$0 == self.dragAnimationPracticeCoordinator})
//
//        guard let coordinator = dragAnimationPracticeCoordinator else { return }
//        childCoordinators.filter{$0 != coordinator}
//
    }
}
