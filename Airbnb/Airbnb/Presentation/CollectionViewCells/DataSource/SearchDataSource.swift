//
//  SearchDataSource.swift
//  Airbnb
//
//  Created by Jason on 10/25/23.
//

import UIKit

final class SearchDataSource: NSObject, UICollectionViewDataSource {
    
    init(items: [Destination]) {
        self.items = items
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelListCell.identifier,
                                                            for: indexPath) as? TravelListCell else {
            return UICollectionViewCell()
        }
        cell.configureItems(items[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else {
                return UICollectionReusableView()
            }
            headerView.configureHeaderText(text: "근처의 인기 여행지")
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    private var items: [Destination]
}
