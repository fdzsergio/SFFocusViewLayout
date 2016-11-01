//
//  CollectionViewController.swift
//  SFFocusViewLayout
//
//  Created by Sergio Fernández Durán on 1/30/16.
//  Copyright © 2016 fdzsergio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

final class CollectionViewController: UICollectionViewController {

    var items: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

}
