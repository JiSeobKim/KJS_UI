//
//  MainBuilder.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/13.
//  Copyright © 2022 JS. All rights reserved.
//

struct MainBuilder {

    let coordinator: MainCoordinator
    private let mainVC: MainViewController
    private let sections: [MainSection]
    private let mainViewModel: MainViewModel

    init() {
        sections = [
            .uikit(rows: [
                .collectionView,
                .tabBar
            ]),
            .experiment(rows: [
                .dragAnimation,
                .dragAnimationForBlog
            ]),
            .combine(rows: [
                .basicAsyncAwait
            ]),
            .rxswift(rows: [
                .subscribeOnObserveOn
            ])
        ]
        mainViewModel = MainViewModel(sections: sections)
        mainVC = MainViewController(viewModel: mainViewModel)

        coordinator = MainCoordinator(vc: mainVC, vm: mainViewModel)
    }
}
