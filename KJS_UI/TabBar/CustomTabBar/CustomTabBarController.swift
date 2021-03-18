//
//  CustomTabBarController.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/03/18.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit
protocol AnimationTabIconView: UIView {
    func onAnimation()
    func offAnimation()
}

class CustomTabBarController: UITabBarController {
    
    var itemWidth: CGFloat?
    var viewList: [AnimationTabIconView] = []
    
    var selectedView: AnimationTabIconView? {
        didSet {
            selectedView?.onAnimation()
            oldValue?.offAnimation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        if itemWidth == nil {
            self.itemWidth = self.view.frame.width / CGFloat(self.tabBar.items?.count ?? 1)
            addAnimationViews()
        }
    }
    
    func addAnimationViews() {
        
        
        guard let w = self.itemWidth else { return }
        let vWidth: CGFloat = 30
        let newX = ((w - vWidth) / 2)
        
        for row in self.tabBar.subviews {
            let v = SettingTabIcon(frame: CGRect(x: newX, y: 0, width: vWidth, height: 30))
            row.addSubview(v)
            self.viewList.append(v)
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.aniViewTouchEvent(_:)))
            v.addGestureRecognizer(gesture)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item) else { return }
        print(index)
        let next = self.viewList[index]
        guard !(next === selectedView) else { return }
        selectedView = next
    }
    
    @objc func aniViewTouchEvent(_ recognizer: UITapGestureRecognizer) {
        guard let convertedView = recognizer.view as? AnimationTabIconView else { return }
        
        guard let index = self.viewList.firstIndex(where: {$0 == convertedView}), let item = self.tabBar.items?[index] else { return }
        self.tabBar(tabBar, didSelect: item)
        self.selectedIndex = index
    }
    
    
    func animateClick(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            view.transform = CGAffineTransform(rotationAngle: .pi / 3)
        }

    }
    
    func animateUnclick(view: UIView) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
            view.transform = .identity
        }
    }
}
