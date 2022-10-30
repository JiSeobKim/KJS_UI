//
//  UIView+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/10/30.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

extension UIView {

    func applyBorder(r: CGFloat = 8, color: UIColor = .systemPink, width: CGFloat = 1) {
        layer.cornerRadius = r
        layer.cornerCurve = .continuous
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
