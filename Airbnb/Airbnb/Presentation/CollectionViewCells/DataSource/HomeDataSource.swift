//
//  HomeDataSource.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit
import RxSwift

enum SectionList: Int, CaseIterable {
    case poster = 0
    case travelList
    case recommendation
}

final class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    func giveToTravelItems() -> [Destination]? {
        guard let items  = self.apiManager?.getAllTravelList() else {
            return nil
        }
        return items
    }
    
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
        case .travelList:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TravelListCell.identifier, for: indexPath) as? TravelListCell else { 
                return UICollectionViewCell()
            }
            
            if let item = self.apiManager?.getItem(indexPath: indexPath) {
                if let cacheImage = UIImage(named: item.imageName) {
                    ImageCacheManager.shared.setObject(cacheImage, forKey: NSString(string: item.imageName))
                }
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
            
            headerTexts.bind { texts in
                headerView.configureHeaderText(text: texts[sectionType.rawValue])
            }.disposed(by: DisposeBag())
            
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    private var apiManager: JSONParsable? = APIManager()
    private let headerTexts = Observable.of(["","가까운 여행지 둘러보기", "어디에서나,여행은 \n살아보는거야!"])
}
