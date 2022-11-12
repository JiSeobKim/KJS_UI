//
//  SubscribeOnOberveOnBuilder.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/11/12.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

struct SubscribeOnOberveOnBuilder {

    static func make() -> UIViewController {
        let vm = SubscribeOnOberveOnViewModel()
        let vc = SubscribeOnOberveOnViewController(viewModel: vm)
        return vc
    }
}
