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
}


extension MainCoordinator: DragAnimationPracticeCoordinatorDelegate {
    func detachDragAnimationPracticeCoordinator() {
//        dragAnimationPracticeCoordinator.map{ coordinator in
//            let index = childCoordinators.last(where: {$0 is DragAnimationPracticeCoordinator})
//            index
//        }
//
//        childCoordinators.removeAll(where: {$0 == self.dragAnimationPracticeCoordinator})
        
        guard let coordinator = dragAnimationPracticeCoordinator else { return }
        childCoordinators.filter{$0 != coordinator}
        
    }
}
