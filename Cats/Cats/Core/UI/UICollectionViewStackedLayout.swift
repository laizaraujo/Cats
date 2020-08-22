//
//  UICollectionViewStackedLayout.swift
//  Cats
//
//  Created by Laiza Souza on 21/08/20.
//  Copyright © 2020 cats. All rights reserved.
//

import UIKit

class UICollectionViewStackedLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect) ?? []
        for attribute in attributes where attribute.representedElementKind == nil {
            let indexPath = attribute.indexPath
            if let attributes = layoutAttributesForItem(at: indexPath) {
                attribute.frame = attributes.frame
            }
        }

        return attributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.layoutAttributesForItem(at: indexPath) else { return nil }

        if indexPath.item == 0 || indexPath.item == 1 {
            var frame = attributes.frame
            frame.origin.y = 0
            attributes.frame = frame
            return attributes
        }

        let previousIndexPath = IndexPath(item: indexPath.item - 2, section: indexPath.section)
        guard let previousAttributes = layoutAttributesForItem(at: previousIndexPath) else { return attributes }
        let previousFrame = previousAttributes.frame

        let previousRight = previousFrame.origin.y + previousFrame.size.height + 10
        if attributes.frame.origin.y <= previousRight {
            return attributes
        }

        var frame = attributes.frame
        frame.origin.y = previousRight
        attributes.frame = frame

        return attributes
    }
}
