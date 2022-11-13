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
    case combine(rows: [MainRow])
    case rxswift(rows: [MainRow])

    var title: String {
        switch self {
        case .uikit: return "UIKit"
        case .experiment: return "Experiment"
        case .combine: return "Combine"
        case .rxswift: return "RxSwift"
        }
    }

    var rows: [MainRow] {
        switch self {
        case .uikit(let rows): return rows
        case .experiment(let rows): return rows
        case .combine(let rows): return rows
        case .rxswift(let rows): return rows
        }
    }
}

enum MainRow: Hashable {

    case collectionView
    case tabBar

    case dragAnimation
    case dragAnimationForBlog

    case subscribeOnObserveOn

    case basicAsyncAwait

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
        case .subscribeOnObserveOn:
            text = "SubscribeOn & ObserveOn"
        case .basicAsyncAwait:
            text = "Basic Async & Await"
        }
        return text.attachEmoji()
    }
}
