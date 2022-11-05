//
//  Array+Utils.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/06.
//  Copyright © 2022 JS. All rights reserved.
//

import Foundation

extension Array {

    subscript(safe at: Int) -> Element? {
        guard indices ~= at else { return nil }
        return self[at]
    }
}
