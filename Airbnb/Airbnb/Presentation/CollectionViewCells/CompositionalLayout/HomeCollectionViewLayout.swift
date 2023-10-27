//
//  HomeCollectionViewLayout.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

struct HomeCollectionViewLayout {
    
    private let sectionIndex: Int
    
    init(sectionIndex: Int) {
        self.sectionIndex = sectionIndex
    }
    
    func createLayout() -> NSCollectionLayoutSection? {
        let index = SectionList.allCases[sectionIndex]

        switch index {
        case .poster:
            return posterLayout()
        case .travelList:
            return travelListLayout()
        case .recommendation:
            return recommendationLayout()
        }
    }
    
    private func posterLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 / 2.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func travelListLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.8))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .fractionalHeight(0.25))
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.1))
 
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        item.contentInsets = .init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 0.0)
        section.contentInsets = .init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 0.0)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func recommendationLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .fractionalHeight(0.55))
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.1))
        
        let item =  NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        item.contentInsets = .init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 0)
        section.contentInsets = .init(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 0.0)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
