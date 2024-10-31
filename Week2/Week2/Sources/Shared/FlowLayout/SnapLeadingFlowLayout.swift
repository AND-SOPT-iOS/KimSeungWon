//
//  SnapLeadingFlowLayout.swift
//  Week2
//
//  Created by 김승원 on 10/31/24.
//

import UIKit

final class SnapLeadingFlowLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let targetLeading = proposedContentOffset.x + sectionInset.left

        // 현재 보여지는 영역을 기반으로 레이아웃 속성 가져오기
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.width, height: collectionView.bounds.height)
        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
        
        layoutAttributesArray?.forEach { layoutAttributes in
            let itemLeading = layoutAttributes.frame.origin.x
            
            if abs(itemLeading - targetLeading) < abs(offsetAdjustment) {
                offsetAdjustment = itemLeading - targetLeading
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
