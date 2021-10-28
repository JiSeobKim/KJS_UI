//
//  DragAnimationCoordinator.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

class DragAnimationPracticeCoordinator: CoordinatorPattern {
    
    var viewController: UIViewController
    
    required init() {
        self.viewController = UIViewController.makeViewController(storyboardName: "Main", identifier: "DragAnimationVC")
    }
}
