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
    var cellItems: [String] { get }
    
    init(models: [MainModel])
}

class MainViewModel: MainViewModelAvailable  {
    
    var cellItems: [String]
    var coordinatorListener: MainViewControllerCoordinatorListener?
    
    private var models: [MainModel]
    
    required init(models: [MainModel]) {
        self.cellItems = models.map{$0.title}
        self.models = models
    }
    
    func viewDidDisappear() {
        coordinatorListener?.detachMainView()
    }
    
    func didTapCell(index: Int) {
        switch models[index] {
        case .dragAnimation:
            coordinatorListener?.attachDragAnimationPractice()
        case .dragAnimationForBlog:
            coordinatorListener?.attachDragAnimationBlog()
        case .collectionView:
            coordinatorListener?.attachCollectionView()
        case .tabBar:
            coordinatorListener?.attachTabBarViewController()
        }
    }
}
