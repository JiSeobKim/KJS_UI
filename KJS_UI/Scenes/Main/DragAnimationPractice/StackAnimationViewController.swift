//
//  StackAnimationViewController.swift
//  SpeechTest
//
//  Created by kimjiseob on 2020/02/24.
//  Copyright © 2020 JS. All rights reserved.
//

import UIKit

class StackAnimationViewController: UIViewController {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var btnStackView: UIStackView!
    @IBOutlet var collecterView: UIView!
    
    
    var scrollView: UIScrollView?
    
    private var viewGesture: UIGestureRecognizer?
    private var scrollViewGesture: UIGestureRecognizer?
    private var isLongPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.view.subviews.forEach {
            if $0 is UIScrollView {
                self.scrollView = ($0 as! UIScrollView)
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    
    private func addView() {
        
        let numbering: CGFloat = CGFloat(self.stackView.arrangedSubviews.count)
        
        var randomRGB: CGFloat {
            let random = CGFloat.random(in: 0...255)
            return random / 255
        }
        
        var viewSize: CGSize {
            let width = self.stackView.frame.width
            let height = width * 0.5
            return CGSize(width: width, height: height)
        }
        
        let color = UIColor.init(red: randomRGB, green: randomRGB, blue: randomRGB, alpha: 1)
        let addView = UIView(frame: CGRect(origin: .zero, size: viewSize))
        addView.backgroundColor = color
        
        let heightAnchor = addView.heightAnchor.constraint(equalToConstant: viewSize.height)
        heightAnchor.isActive = true
        
        self.stackView.addArrangedSubview(addView)
        
        // Layer
        addView.layer.zPosition = -(numbering)
        addView.layer.cornerRadius = 8
        
        
        // Drag Gesture
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(dragGetsture(_:)))
        gesture.delegate = self
        
        
        self.dragGetsture(gesture)
        addView.addGestureRecognizer(gesture)
        
        // Long touch Gesture
        let lGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGesture(_:)))
        addView.addGestureRecognizer(lGesture)
    }
    
    
    
    @IBAction func addViewAction(_ sender: Any) {
        self.addView()
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        self.stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    
    
    /// Drag Gesture
    @objc
    func dragGetsture(_ recognizer: UIPanGestureRecognizer) {
        let position = recognizer.translation(in: self.view)
        let view = recognizer.view
        switch recognizer.state {
        case .changed:
            let maxValue: CGFloat = 50
            var now = position.y.magnitude
            
            if now > maxValue {
                now = maxValue
            }
            
            var newScale: CGFloat = 1 - ((now / maxValue) * 0.2)
            
            if let previousScale = view?.transform.d {
                newScale = CGFloat.minimum(newScale, previousScale)
            }
            let transform = CGAffineTransform(translationX: position.x, y: position.y).scaledBy(x: newScale, y: newScale)
            view?.transform = transform
            
            
            
            let aaa = recognizer.location(in: self.collecterView)
            
            let isOnX = 0...self.collecterView.frame.width ~= aaa.x
            let isOnY = 0...self.collecterView.frame.height ~= aaa.y
            
            let isOn = isOnY && isOnX
            
            let color: UIColor = (isOn) ? .black : .systemRed
            let radius: CGFloat = isOn ? self.collecterView.frame.height / 2 : 0
            UIView.animate(withDuration: 0.5) {
                self.collecterView.backgroundColor = color
                self.collecterView.layer.cornerRadius = radius
            }
            
            
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                view?.transform = .identity
                self.collecterView.backgroundColor = .systemRed
                self.collecterView.layer.cornerRadius = 0
            }, completion: nil)
            print("End")
        default:
            break
        }
    }
    
    /// Long touch gesture
    @objc
    func longGesture(_ recognizer: UILongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            print("Long pressed - Start")
            guard let view = recognizer.view else { return }
            
            self.isLongPressed = true
            
            view.layer.zPosition = -(view.layer.zPosition)
            UIView.animate(withDuration: 0.4) {
                recognizer.view?.alpha = 0.3
            }
            
            
        case .ended:
            print("Long pressed - End")
            guard let view = recognizer.view else { return }
            self.isLongPressed = false
            
            UIView.animate(withDuration: 0.4, animations: {
                recognizer.view?.alpha = 1
            }) { _ in
                view.layer.zPosition = -(view.layer.zPosition)
            }
            
        default:
            break
        }
    }
}


extension StackAnimationViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if otherGestureRecognizer.view is UIScrollView, let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let _ = pan.translation(in: self.scrollView)
            
            let becomeResetGesture = self.isLongPressed ? otherGestureRecognizer : gestureRecognizer
            
            becomeResetGesture.isEnabled = false
            becomeResetGesture.isEnabled = true
        }
        
        return true
    }
}
