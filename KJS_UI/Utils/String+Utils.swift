//
//  String+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/06.
//  Copyright © 2022 JS. All rights reserved.
//

import Foundation

extension String {

    static func randomEmoji() -> String {
        return String(UnicodeScalar(Array(0x1F300...0x1F3F0).randomElement()!)!)
    }

    func attachEmoji() -> String {
        return "\(String.randomEmoji()) \(self)"
    }
}
