//
//  CoordinatorPattern.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit


protocol CoordinatorPattern: AnyObject {
    var childCoordinators: [CoordinatorPattern] { get set }
    var navigationController: UINavigationController? { get }
    var viewController: UIViewController? { get }
    
    func activeWithPush(viewController: UIViewController?)
    func presentInsideNavigation(viewController: UIViewController?)
}


extension CoordinatorPattern {
    var navigationController: UINavigationController? { viewController?.navigationController }
    
    func presentInsideNavigation(viewController: UIViewController?) {
        guard let vc = viewController else { return }
        let navigation = UINavigationController(rootViewController: vc)
        self.viewController?.present(navigation, animated: true, completion: nil)
    }
    func activeWithPush(viewController: UIViewController?) {
        guard
            let navi = navigationController,
            let vc = viewController
        else { return }
        navi.pushViewController(vc, animated: true)
    }
}
