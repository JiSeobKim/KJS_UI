//
//  DiffableDataSourceCollectionVC.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/10/30.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

final class DiffableDataSourceCollectionVC: UIViewController {

    private enum Metric {

        static let buttonHeight: CGFloat = 40
        static let buttonFontSize: CGFloat = 15
    }

    private let cellID = "cell"
    private let vm = DiffableDataSourceCollectionVM()
    private let mainColor: UIColor = .systemBlue

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DiffableDataSourceCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private lazy var mainStackView: UIStackView = {
        let st = UIStackView.makeBaseStackView()
        [collectionView, insertStackView, reloadStackView, updateAllColorsButton].forEach { st.addArrangedSubview($0) }
        return st
    }()

    private lazy var insertStackView: UIStackView = {
        let st = UIStackView.makeBaseStackView()
        st.axis = .horizontal
        st.distribution = .fillEqually
        [addButton, addTwoElementButton].forEach { st.addArrangedSubview($0) }
        return st
    }()

    private lazy var addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add 1 Element", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: Metric.buttonFontSize)
        btn.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        btn.applyBorder(color: mainColor)
        return btn
    }()

    private lazy var addTwoElementButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add 2 Element", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: Metric.buttonFontSize)
        btn.addTarget(self, action: #selector(addTwoElementAction), for: .touchUpInside)
        btn.applyBorder(color: mainColor)
        return btn
    }()

    private lazy var reloadStackView: UIStackView = {
        let st = UIStackView.makeBaseStackView()
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.addArrangedSubview(reloadFirstButton)
        return st
    }()

    private lazy var reloadFirstButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.addTarget(self, action: #selector(updateFirstColorAction), for: .touchUpInside)
        btn.titleLabel?.font = .boldSystemFont(ofSize: Metric.buttonFontSize)
        btn.setTitle("Update First Item Color", for: .normal)
        btn.applyBorder()
        return btn
    }()

    private lazy var updateAllColorsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.addTarget(self, action: #selector(updateAllColorsAction), for: .touchUpInside)
        btn.titleLabel?.font = .boldSystemFont(ofSize: Metric.buttonFontSize)
        btn.setTitle("Update All Color", for: .normal)
        btn.applyBorder()
        return btn
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDataSource()
    }

    private func setUI() {
        title = "Diffable DataSource"
        view.backgroundColor = .systemBackground
        view.addSubview(mainStackView)
        let padding: CGFloat = 12
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding).isActive = true

        insertStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
        reloadStackView.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true

        updateAllColorsButton.heightAnchor.constraint(equalToConstant: Metric.buttonHeight).isActive = true
    }

    private func setDataSource() {
        vm.dataSource = DiffableDataSourceCollectionDataSource(collectionView: collectionView) { collectionView, indexPath, object in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! DiffableDataSourceCollectionCell
            cell.inject(object.title, color: object.color)
            return cell
        }
    }

    @objc
    private func addAction() {
        vm.addOneElement()
    }

    @objc
    private func addTwoElementAction() {
        vm.addTwoElement()
    }

    @objc
    private func updateFirstColorAction() {
        vm.updateFirstColor()
    }

    @objc
    private func updateAllColorsAction() {
        vm.updateAllColors()
    }
}
