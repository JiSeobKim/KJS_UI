//
//  SettingTabIcon.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/03/18.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

class SettingTabIcon: UIView, AnimationTabIconView {
    @IBOutlet weak var line1: UIView!
    @IBOutlet weak var line2: UIView!
    @IBOutlet weak var line3: UIView!
    
    @IBOutlet weak var dot1: UIView!
    @IBOutlet weak var dot2: UIView!
    @IBOutlet weak var dot3: UIView!
    
    
    var lineList: [UIView] {
        return [line1, line2, line3]
    }
    var dotList: [UIView] {
        return [dot1, dot2, dot3]
    }
    
    private var leftPosition: CGFloat = 3
    private var rightPosition: CGFloat = 18
    private var offColor = UIColor.systemPink.withAlphaComponent(0.5)
    private var onColor = UIColor.systemBlue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        guard let v = Bundle.main.loadNibNamed("SettingTabIcon", owner: self, options: nil)?.first as? UIView else { return }
        
        v.frame = self.bounds
        initUI()
        self.addSubview(v)
    }
    
    private func initUI() {
        lineList.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
            $0.backgroundColor = offColor
        }
        
        dotList.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
            $0.backgroundColor = offColor
        }
    }
    
    func onAnimation() {
        for row in lineList {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                row.backgroundColor = self.onColor
            }
        }
        
        for row in dotList {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                row.backgroundColor = self.onColor
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            [self.dot1, self.dot3].forEach {
                $0?.frame.origin.x = self.rightPosition
            }
            self.dot2.frame.origin.x = self.leftPosition
        }
    }
    
    func offAnimation() {
        for row in lineList {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                row.backgroundColor = self.offColor
            }
        }
        
        for row in dotList {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                row.backgroundColor = self.offColor
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            [self.dot1, self.dot3].forEach {
                $0?.frame.origin.x = self.leftPosition
            }
            self.dot2.frame.origin.x = self.rightPosition
        }
    }

}
