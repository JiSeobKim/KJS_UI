//
//  UIView+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/10/30.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

extension UIView {

    func applyBorder(r: CGFloat = 8, color: UIColor = Colors.mainColor, width: CGFloat = 1) {
        applyCurve(r: r)
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }

    func applyShadow(
        color: UIColor = Colors.mainColor,
        opacity: Float = 1,
        radius: CGFloat = 5,
        offset: CGSize = CGSize(width: 0, height: 0)
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowPath = nil
    }

    func applyCurve(r: CGFloat = 8) {
        layer.cornerRadius = r
        layer.cornerCurve = .continuous
    }

    func applyShadowAndBorder(color: UIColor = Colors.mainColor) {
        applyBorder(color: color)
        applyShadow(color: color)
    }
}
