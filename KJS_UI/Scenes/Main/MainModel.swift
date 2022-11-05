//
//  MainModel.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit

protocol MainSectionType: Hashable {

    var sectionTitle: String { get }
    var rows: [AnyHashable] { get }
}

final class MainSectionTypeImp: MainSectionType {

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    static func == (lhs: MainSectionTypeImp, rhs: MainSectionTypeImp) -> Bool {
        return lhs === rhs
    }

    enum SectionType: CaseIterable {

        case uikit
        case experiment

        var title: String {
            switch self {
            case .uikit: return "UIKit"
            case .experiment: return "Experiment"
            }
        }
    }

    private var sectionType: SectionType
    var sectionTitle: String { sectionType.title }
    var rows: [AnyHashable]

    init(_ type: SectionType, rows: [AnyHashable]) {
        self.sectionType = type
        self.rows = rows
    }
}

protocol MainRowType: Hashable {

    var title: String { get }
}

enum ExperimentRowType: MainRowType, CaseIterable {

    case dragAnimation
    case dragAnimationForBlog

    var title: String {
        switch self {
        case .dragAnimation: return "Drag Animation"
        case .dragAnimationForBlog: return "Drag Animation (Blog)"
        }
    }
}

enum UIKitSectionType: MainRowType, CaseIterable {

    case collectionView
    case tabBar

    var title: String {
        switch self {
        case .collectionView: return "CollectionView"
        case .tabBar: return "TabBar"
        }
    }
}
