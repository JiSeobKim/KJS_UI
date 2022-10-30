//
//  DiffableDataSourceCollectionVC.swift
//  KJS_UI
//
//  Created by 김지섭 on 2022/10/30.
//  Copyright © 2022 JS. All rights reserved.
//

import UIKit

final class DiffableDataSourceCollectionVC: UIViewController {

    enum Section: CaseIterable {
        case first
        case second
    }

    private var sectionData: [Section] = [.first]
    private var rowData: [String] = ["1", "2", "3"]
    private let cellID = "cell"
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
        [collectionView, inputStackView].forEach { st.addArrangedSubview($0) }
        return st
    }()

    private lazy var inputStackView: UIStackView = {
        let st = UIStackView.makeBaseStackView()
        st.axis = .horizontal
        st.distribution = .fillEqually
        [addButton, addTwoElementButton].forEach { st.addArrangedSubview($0) }
        return st
    }()

    private lazy var addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add 1 Element", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        btn.applyBorder(color: mainColor)
        return btn
    }()

    private lazy var addTwoElementButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add 2 Element", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(addTwoElementAction), for: .touchUpInside)
        btn.applyBorder(color: mainColor)
        return btn
    }()

    private lazy var dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { collectionView, indexPath, text in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! DiffableDataSourceCollectionCell
        cell.inject(text, color: self.mainColor)
        return cell
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        applyDataSource()
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

        inputStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc
    private func addAction() {
        let newValue = String(rowData.count + 1)
        let index = (0..<rowData.count).randomElement()!
        rowData.insert(newValue, at: index)
        applyDataSource()
    }

    @objc
    private func addTwoElementAction() {
        let newValue1 = String(rowData.count + 1)
        let newValue2 = String(rowData.count + 2)
        let index1 = (0..<rowData.count).randomElement()!
        let index2 = (0..<rowData.count).randomElement()!
        rowData.insert(newValue1, at: index1)
        rowData.insert(newValue2, at: index2)
        applyDataSource()
    }

    private func applyDataSource() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, String>()
        snapShot.appendSections(sectionData)
        snapShot.appendItems(rowData, toSection: .first)
        dataSource.apply(snapShot, animatingDifferences: true)
    }
}
