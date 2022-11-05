//
//  MainViewModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation

protocol MainViewControllerCoordinatorListener {
    
    func detachMainView()
    func attachDragAnimationPractice()
    func attachDragAnimationBlog()
    func attachCollectionView()
    func attachTabBarViewController()
}

protocol MainViewModelAvailable: MainViewEventListener {
    var coordinatorListener: MainViewControllerCoordinatorListener? { get set }
    var sections: [AnyHashable] { get }
    
    init(sections: [AnyHashable])
}

class MainViewModel: MainViewModelAvailable  {
    
    var sections: [AnyHashable]
    var coordinatorListener: MainViewControllerCoordinatorListener?

    required init(sections: [AnyHashable]) {
        self.sections = sections
    }
    
    func viewDidDisappear() {
        coordinatorListener?.detachMainView()
    }
    
    func didTapCell(_ indexPath: IndexPath) {
//        switch sections[index] {
//        case .dragAnimation:
//            coordinatorListener?.attachDragAnimationPractice()
//        case .dragAnimationForBlog:
//            coordinatorListener?.attachDragAnimationBlog()
//        case .collectionView:
//            coordinatorListener?.attachCollectionView()
//        case .tabBar:
//            coordinatorListener?.attachTabBarViewController()
//        }
    }
}
