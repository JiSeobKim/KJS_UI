//
//  ViewController.swift
//  KJS_UI
//
//  Created by kimjiseob on 2020/02/24.
//  Copyright © 2020 JS. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MainViewModel!
    private let cellID: String = "cell"
    private let collectionViewPadding: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
        setCollectionView()
    }
    
    private func setCollectionView() {
        let flowlayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            
            
            let itemWidth = (self.view.frame.width / 2) - (collectionViewPadding + collectionViewPadding / 2)
            layout.itemSize = .init(width: itemWidth, height: itemWidth)
            layout.minimumInteritemSpacing = collectionViewPadding
            layout.minimumLineSpacing = collectionViewPadding
            
            return layout
        }()
        
        collectionView.collectionViewLayout = flowlayout
        collectionView.contentInset = UIEdgeInsets(
            top: collectionViewPadding,
            left: collectionViewPadding,
            bottom: collectionViewPadding,
            right: collectionViewPadding)
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        if let cCell = cell as? MainViewCell {
            let title = viewModel.cellItems[indexPath.row]
            cCell.setTitle(with: title)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didTapCell(index: indexPath.row)
    }
}

