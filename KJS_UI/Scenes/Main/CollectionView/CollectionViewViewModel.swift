//
//  CollectionViewViewModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/29.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation

protocol CollectionViewCoordinatorListener {
    func attachHeaderAutoLayoutCollection()
}

protocol CollectionViewViewModelAvailable: CollectionViewPresentableListener {
    init(coordinatorListener: CollectionViewCoordinatorListener)
}

class CollectionViewViewModel: CollectionViewViewModelAvailable {
    private var coordinatorListener: CollectionViewCoordinatorListener
    
    required init(coordinatorListener: CollectionViewCoordinatorListener) {
        self.coordinatorListener = coordinatorListener
    }
    
    func didTapHeaderAutoLayout() {
        coordinatorListener.attachHeaderAutoLayoutCollection()
    }
}
