//
//  DragAnimationStep1ViewController.swift
//  KJS_UI
//
//  Created by 김지섭 on 2020/03/01.
//  Copyright © 2020 JS. All rights reserved.
//

import UIKit

class DragAnimationStep1ViewController: UIViewController {
    
    @IBOutlet weak var longTouchView: UIView!
    @IBOutlet weak var panGetstureView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longTouchGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTouchAction(_:)))
        
        
        self.longTouchView.addGestureRecognizer(longTouchGesture)
        
        
    }
    
    @objc
    func longTouchAction(_ recognizer: UILongPressGestureRecognizer) {
        let point = recognizer.location(in: self.view)
        print("터치 포인트를 self.view를 주체로 변환한 위치값- x:\(point.x), y: \(point.y)")
        let point2 = recognizer.location(in: self.longTouchView)
        print("터치 포인트를 자기 자신을 주체로 변환한 위치값- x:\(point2.x), y: \(point2.y)")
//        switch recognizer.state {
//        case .possible:
//            <#code#>
//        case .began:
//            <#code#>
//        case .changed:
//            <#code#>
//        case .ended:
//            <#code#>
//        case .cancelled:
//            <#code#>
//        case .failed:
//            <#code#>
//        @unknown default:
//            <#code#>
//        }
    }
}
