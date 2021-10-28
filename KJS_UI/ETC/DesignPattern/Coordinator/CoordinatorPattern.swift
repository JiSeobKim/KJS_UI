//
//  CoordinatorPattern.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import Foundation
import UIKit


protocol CoordinatorPattern {

    var parent: CoordinatorPattern? { get }
    var childCoordinators: [CoordinatorPattern] { get set }
    var navigationController: UINavigationController? { get }
    var presenterViewController: UIViewController? { get }
    var viewController: UIViewController { get }
    
    init(
        parent: CoordinatorPattern?,
        navigationController: UINavigationController?,
        presenterViewController: UIViewController?
    )
    
    func activeWithPush()
    func activeWithPresent()
}

extension CoordinatorPattern {
    
    func activeWithPush() {
        guard let navi = navigationController else { return }
        navi.pushViewController(viewController, animated: true)
    }
    func activeWithPresent() {
        guard let presenter = presenterViewController else { return }
        presenter.present(viewController, animated: true, completion: nil)
    }
}
