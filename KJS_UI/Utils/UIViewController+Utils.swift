//
//  UIViewController+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

extension UIViewController {
    static func makeViewController(storyboardName sbNm: String, identifier: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: sbNm, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: identifier)
        return vc
    }
}


