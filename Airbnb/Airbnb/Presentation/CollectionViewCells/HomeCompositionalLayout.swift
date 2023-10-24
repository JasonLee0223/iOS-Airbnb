//
//  HomeCompositionalLayout.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

struct HomeCompositionalLayout {
    
    private let sectionIndex: Int
    
    init(sectionIndex: Int) {
        self.sectionIndex = sectionIndex
    }
    
    func createLayout() -> NSCollectionLayoutSection? {
        let index = SectionList.allCases[sectionIndex]

        switch index {
        case .poster:
            return posterLayout()
        case .nearByTravel:
            return nearByTravelLayout()
        case .recommendation:
            return recommendationLayout()
        }
    }
    
    private func posterLayout() -> NSCollectionLayoutSection? {
        let itemInset: CGFloat = 0.0
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0 / 2.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        item.contentInsets = .init(top: itemInset, leading: itemInset, bottom: 40.0, trailing: itemInset)
        section.contentInsets = .init(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
        return section
    }
    
    private func nearByTravelLayout() -> NSCollectionLayoutSection? {
        let itemInset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75), heightDimension: .fractionalWidth(0.5))
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0 / 4.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        item.contentInsets = .init(top: itemInset, leading: 16.0, bottom: 24.0, trailing: itemInset)
        section.contentInsets = .init(top: itemInset, leading: 16.0, bottom: itemInset, trailing: itemInset)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func recommendationLayout() -> NSCollectionLayoutSection? {
        let itemInset: CGFloat = 2.5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1))
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(335), heightDimension: .estimated(420))
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0 / 4.0))
        
        let item =  NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        item.contentInsets = .init(top: 28, leading: 16, bottom: 24, trailing: 0)
        section.contentInsets = .init(top: itemInset, leading: 16.0, bottom: itemInset, trailing: itemInset)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
