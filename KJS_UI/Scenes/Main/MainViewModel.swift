//
//  MainViewModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation

protocol MainViewControllerCoordinatorListener {
    
    func attachDragAnimationPractice()
    func attachDragAnimationBlog()
}

protocol MainViewModelAvailable {
    var coordinatorListener: MainViewControllerCoordinatorListener? { get set }
    var cellItems: [String] { get }
    
    init(models: [MainModel])
    func didTapCell(index: Int)
}

class MainViewModel: MainViewModelAvailable  {
    
    var cellItems: [String]
    var coordinatorListener: MainViewControllerCoordinatorListener?
    
    private var models: [MainModel]
    
    required init(models: [MainModel]) {
        self.cellItems = models.map{$0.title}
        self.models = models
    }
    
    func didTapCell(index: Int) {
        switch models[index] {
        case .dragAnimation:
            coordinatorListener?.attachDragAnimationPractice()
        case .dragAnimationForBlog:
            coordinatorListener?.attachDragAnimationBlog()
        case .collectionView:
            break
        case .tabBar:
            break
        }
    }
}
