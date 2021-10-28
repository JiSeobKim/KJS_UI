//
//  ViewController.swift
//  KJS_UI
//
//  Created by kimjiseob on 2020/02/24.
//  Copyright © 2020 JS. All rights reserved.
//

import UIKit

protocol MainViewControllerCoordinatorListner {
    func attachDragAnimationPractice()
    func attachDragAnimationBlog()
}


class MainViewController: UIViewController {
    
    var coordinatorListener: MainViewControllerCoordinatorListner?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func test(_ sender: Any) {
        coordinatorListener?.attachDragAnimationPractice()
    }
}

