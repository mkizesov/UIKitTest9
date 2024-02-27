//
//  DamnFlowLayout.swift
//  UIKitTest9
//
//  Created by M K on 25.02.2024.
//

import UIKit

class DamnFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }

        let pageWidth = itemSize.width + minimumLineSpacing
        
        let pageOffset = proposedContentOffset.x / pageWidth
        var targetPageOffset = pageOffset
        
        if velocity.x > 0 {
            targetPageOffset = ceil(pageOffset)
        } else if velocity.x < 0 {
            targetPageOffset = floor(pageOffset)
        } else {
            targetPageOffset = round(pageOffset)
        }
        
        let newOffsetX = targetPageOffset * pageWidth - collectionView.contentInset.left
        let clampedOffsetX = max(min(newOffsetX, collectionView.contentSize.width - collectionView.bounds.size.width), 0)
        return CGPoint(x: clampedOffsetX, y: 0)
    }

    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }

        let collectionViewWidth = collectionView.bounds.size.width
        let itemWidth = collectionViewWidth * 0.8
        self.itemSize = CGSize(width: itemWidth, height: collectionView.bounds.size.height)
        self.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        self.minimumLineSpacing = 10
        self.scrollDirection = .horizontal
    }
}

