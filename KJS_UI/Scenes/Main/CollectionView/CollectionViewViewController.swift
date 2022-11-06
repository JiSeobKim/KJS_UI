//
//  CollectionViewViewController.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/10/29.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

protocol CollectionViewPresentableListener {
    func didTapHeaderAutoLayout()
    func didTapDiffableDataSource()
}

class CollectionViewViewController: UIViewController {
    
    private let stackView: UIStackView = {
        return .makeBaseStackView()
    }()
    
    private lazy var headerAutoCollectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(
            self,
            action: #selector(didTapHeaderAutoCollection),
            for: .touchUpInside
        )
        
        button.setTitle("HeaderAutoCollection", for: .normal)
        return button
    }()

    private lazy var diffableDataSourceButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(
            self,
            action: #selector(didTapDiffableDataSource),
            for: .touchUpInside
        )

        button.setTitle("Diffable DataSource", for: .normal)
        return button
    }()
    
    var viewModel: CollectionViewViewModel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
    }
    
    private func setViews() {
        
        view.addSubview(stackView)
        view.backgroundColor = .white
        
        stackView.addArrangedSubview(diffableDataSourceButton)
        stackView.addArrangedSubview(headerAutoCollectionButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc
    private func didTapHeaderAutoCollection() {
        viewModel.didTapHeaderAutoLayout()
    }

    @objc
    private func didTapDiffableDataSource() {
        viewModel.didTapDiffableDataSource()
    }
}
