//
//  ViewController.swift
//  UIKitTest9
//
//  Created by M K on 25.02.2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground

        let layout = DamnFlowLayout()
        let frame = CGRect(x: 0, y: view.frame.height / 4, width: view.frame.width, height: view.frame.height / 2)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .normal
        layout.sectionInset = UIEdgeInsets(top: 0, left: collectionView.layoutMargins.left, bottom: 0, right: 0)
    
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 10
        return cell
    }
}
