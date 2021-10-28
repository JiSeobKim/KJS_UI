//
//  DragAnimationBlogCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit


class DragAnimationBlogCoordinator: CoordinatorPattern, DragAnimationBlogCoordinatorListener {
    var viewController: UIViewController
    
    required init() {
        self.viewController = .makeViewController(storyboardName: "Main", identifier: "DragAnimationBlogVC")
        (viewController as? DragAnimationBlogViewController)?.coordinatorListener = self
    }
}
