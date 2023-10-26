//
//  RecommendationCell.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

final class RecommendationCell: UICollectionViewCell, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(recommendationView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureOfItem(imageName: String, summaryText: String) {
        self.recommendationView.configureOfImageView(by: imageName)
        self.recommendationView.configureOfLabelText(summaryText: summaryText)
    }
    
    private let recommendationView = RecommendationView(frame: CGRect(origin: .zero, size: CGSize(width: 253, height: 368)))
}
