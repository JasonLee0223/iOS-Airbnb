//
//  NearByTravelCell.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

final class NearByTravelCell: UICollectionViewCell, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(nearByTravelView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureItems(_ item: Destination) {
        self.nearByTravelView.configureOfImageView(by: item.imageName)
        self.nearByTravelView.configureOfLabelText(travelName: item.name, travelTime: item.distance)
    }
    
    private let nearByTravelView = NearByTravelView(frame: CGRect(origin: .zero, size: CGSize(width: 253, height: 74)))
}
