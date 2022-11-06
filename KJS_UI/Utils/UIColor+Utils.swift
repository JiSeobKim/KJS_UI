//
//  UIColor+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/06.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

extension UIColor {

    static var randomColor: UIColor {
        var randomValue: CGFloat {
            let value = (0...255).randomElement() ?? 0
            return CGFloat(value)
        }

        return UIColor(
            red: randomValue / 255,
            green: randomValue / 255,
            blue: randomValue / 255,
            alpha: 1
        )
    }
}
