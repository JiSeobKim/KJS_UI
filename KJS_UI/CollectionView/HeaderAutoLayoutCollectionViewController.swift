//
//  HeaderAutoLayoutCollectionViewController.swift
//  KJS_UI
//
//  Created by 김지섭 on 2021/01/18.
//  Copyright © 2021 JS. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HeaderAutoLayoutCollectionViewController: UIViewController {
    @IBOutlet weak var collectionV: UICollectionView! {
        didSet {
            collectionV.delegate = self
            collectionV.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
}


extension HeaderAutoLayoutCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .systemTeal
        return cell
    }
}
