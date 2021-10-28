//
//  MainModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation

enum MainModel {
    case dragAnimation
    case dragAnimationForBlog
    case collectionView
    case tabBar
    
    var title: String {
        switch self {
        case .dragAnimation: return "Drag Animation"
        case .dragAnimationForBlog: return "Drag Animation (Blog)"
        case .collectionView: return "CollectionView"
        case .tabBar: return "TabBar"
        }
    }
}
