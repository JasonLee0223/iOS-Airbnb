//
//  SearchCollectionViewLayout.swift
//  Airbnb
//
//  Created by Jason on 10/26/23.
//

import UIKit

struct SearchCollectionViewLayout {
    
    func createSearchLayout() -> NSCollectionLayoutSection? {
        let itemInset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 / 2.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0 / 2.0))
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0 / 5.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        item.contentInsets = .init(top: itemInset, leading: itemInset, bottom: 16.0, trailing: itemInset)
        section.contentInsets = .init(top: itemInset, leading: 16.0, bottom: itemInset, trailing: itemInset)
        section.boundarySupplementaryItems = [header]
        return section
    }
}
