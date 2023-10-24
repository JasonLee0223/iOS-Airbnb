//
//  HomeDataSource.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

enum SectionList: Int, CaseIterable {
    case poster = 0
    case nearByTravel
    case recommendation
}

final class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.apiManager?.numberOfSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionList.allCases[section]
        let itemsCount = self.apiManager?.numberOfItemsInSection(index: sectionType) ?? 0
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionList.allCases[indexPath.section]
        
        switch sectionType {
        case .poster:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PosterCell.identifier, for: indexPath) as? PosterCell else {
                return UICollectionViewCell()
            }
            return cell
        case .nearByTravel:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NearByTravelCell.identifier, for: indexPath) as? NearByTravelCell else { 
                return UICollectionViewCell()
            }
            if let item = self.apiManager?.getItem(indexPath: indexPath) {
                cell.configureItems(item)
            }
            return cell
        case .recommendation:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendationCell.identifier, for: indexPath) as? RecommendationCell else { 
                return UICollectionViewCell()
            }
            let imageStorage = ["blackHouse", "blackHouse", "blackHouse"]
            let textStorage = ["자연생활을 만끽할 수 \n있는 숙소", "자연생활을 만끽할 수 \n있는 숙소", "자연생활을 만끽할 수 \n있는 숙소"]
            
            for (imageName, textName) in zip(imageStorage, textStorage) {
                cell.configureOfItem(imageName: imageName, summaryText: textName)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, 
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionList.allCases[indexPath.section]
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else {
                return UICollectionReusableView()
            }
            
            switch sectionType {
            case .poster: headerView.configureHeaderText()
            case .nearByTravel: headerView.configureHeaderText(text: "가까운 여행지 둘러보기")
            case .recommendation: headerView.configureHeaderText(text: "어디에서나,여행은 \n살아보는거야!")
            }
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    private var apiManager: JSONParsable? = APIManager()
}
