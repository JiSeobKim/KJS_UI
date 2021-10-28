//
//  MainViewCell.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/28.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = UIColor.systemCyan
        label.numberOfLines = 4
        label.textAlignment = .center
        label.lineBreakMode = .byClipping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
    }
    
    func setTitle(with title: String) {
        self.titleLabel.text = title
    }
    
    private func setViews() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemCyan.cgColor
        contentView.layer.cornerRadius = 12
        contentView.layer.cornerCurve = .continuous
        
        self.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
        
        
    }
}
