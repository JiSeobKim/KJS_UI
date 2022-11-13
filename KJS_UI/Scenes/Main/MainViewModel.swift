//
//  MainViewModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewControllerCoordinatorListener {
    
    func detachMainView()
    func attachDragAnimationPractice()
    func attachDragAnimationBlog()
    func attachCollectionView()
    func attachTabBarViewController()
    func attachSubscribeOnObserveOn()
    func attachBasicAsyncAwait()
}

protocol MainViewModelAvailable: MainViewEventListener {
    var coordinatorListener: MainViewControllerCoordinatorListener? { get set }
    var sections: [MainSection] { get }
    var dataSource: MainDiffableDataSource? { get set }
    
    init(sections: [MainSection])
}

class MainViewModel: MainViewModelAvailable  {
    
    var sections: [MainSection]
    var coordinatorListener: MainViewControllerCoordinatorListener?
    var dataSource: MainDiffableDataSource? {
        didSet {
            applyDataSource()
        }
    }
    private var snapshot = NSDiffableDataSourceSnapshot<MainSection, MainRow>()

    required init(sections: [MainSection]) {
        self.sections = sections
    }
    
    func viewDidDisappear() {
        coordinatorListener?.detachMainView()
    }
    
    func didTapCell(_ indexPath: IndexPath) {
        guard let section = sections[safe: indexPath.section] else { return }

        switch section {
        case .uikit(let rows):
            attachRow(rows[safe: indexPath.row])
        case .experiment(let rows):
            attachRow(rows[safe: indexPath.row])
        case .combine(let rows):
            attachRow(rows[safe: indexPath.row])
        case .rxswift(let rows):
            attachRow(rows[safe: indexPath.row])
        }
    }

    func attachRow(_ rowType: MainRow?) {
        guard let rowType else { return }
        switch rowType {
        case .dragAnimation:
            coordinatorListener?.attachDragAnimationPractice()
        case .dragAnimationForBlog:
            coordinatorListener?.attachDragAnimationBlog()
        case .collectionView:
            coordinatorListener?.attachCollectionView()
        case .tabBar:
            coordinatorListener?.attachTabBarViewController()
        case .subscribeOnObserveOn:
            coordinatorListener?.attachSubscribeOnObserveOn()
        case .basicAsyncAwait:
            coordinatorListener?.attachBasicAsyncAwait()
        }
    }
}

private extension MainViewModel {

    func applyDataSource() {
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.rows, toSection: section)
        }
        dataSource?.apply(snapshot)
    }
}
