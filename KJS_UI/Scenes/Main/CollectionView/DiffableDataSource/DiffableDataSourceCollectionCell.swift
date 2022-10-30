//
//  DiffableDataSourceCollectionCell.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/10/30.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

class DiffableDataSourceCollectionCell: UICollectionViewCell {

    private let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .systemPink
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        contentView.applyBorder()
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func inject(_ text: String, color: UIColor) {
        label.text = text
        label.textColor = color
        contentView.layer.borderColor = color.cgColor
    }
}
