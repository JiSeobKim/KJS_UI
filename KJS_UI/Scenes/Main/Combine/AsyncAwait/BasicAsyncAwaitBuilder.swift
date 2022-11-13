//
//  BasicAsyncAwaitBuilder.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/13.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

class BasicAsyncAwaitBuilder {

    static func make() -> UIViewController {
        let vm = BasicAsyncAwaitVM()
        let vc = BasicAsyncAwaitVC(viewModel: vm)
        return vc
    }
}
