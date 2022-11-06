//
//  MainModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit

enum MainSection: Hashable {

    case uikit(rows: [MainRow])
    case experiment(rows: [MainRow])

    var title: String {
        switch self {
        case .uikit: return "UIKit"
        case .experiment: return "Experiment"
        }
    }

    var rows: [MainRow] {
        switch self {
        case .uikit(let rows): return rows
        case .experiment(let rows): return rows
        }
    }
}

enum MainRow: Hashable {

    case collectionView
    case tabBar

    case dragAnimation
    case dragAnimationForBlog

    var title: String {
        var text: String
        switch self {
        case .collectionView:
            text = "CollectionView"
        case .tabBar:
            text = "TabBar"
        case .dragAnimation:
            text = "Drag Animation"
        case .dragAnimationForBlog:
            text = "Drag Animation (Blog)"
        }
        return text.attachEmoji()
    }

    static func makeGroup(with section: MainSection) -> [MainRow] {
        switch section {
        case .uikit:
            return [collectionView, tabBar]
        case .experiment:
            return [dragAnimation, dragAnimationForBlog]
        }
    }
}
