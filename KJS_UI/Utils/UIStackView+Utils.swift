//
//  UIStackView+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/29.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

extension UIStackView {
    
    static func makeBaseStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }
}
