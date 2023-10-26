//
//  TravelListCell.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

final class TravelListCell: UICollectionViewCell, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(travelListView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureItems(_ item: Destination) {
        self.travelListView.configureOfImageView(by: item.imageName)
        self.travelListView.configureOfLabelText(travelName: item.name, travelTime: item.distance)
    }
    
    private let travelListView = TravelListView(frame: CGRect(origin: .zero, size: CGSize(width: 253, height: 74)))
}
