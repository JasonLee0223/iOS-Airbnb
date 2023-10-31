//
//  WishInfoView.swift
//  Airbnb
//
//  Created by Jason on 10/31/23.
//

import UIKit
//import SnapKit

final class WishInfoView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAttributes()
        self.setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureOfLabel(itemNameText: String, priceText: String) {
        self.itemNameLabel.text = itemNameText
        self.priceLabel.text = priceText
    }
    
    func configureOfLabel(gradeText: String, gradeCountText: String) {
        self.wishInfoStackView.configureOfLabel(gradeText: gradeText, gradeCountText: gradeCountText)
    }
    
    private let wishInfoStackView = WishInfoStackView(frame: CGRect(x: 25, y: 150, width: 113, height: 18))
    private let itemNameLabel = UILabel()
    private let priceLabel = UILabel()
    
    private func setAttributes() {
        self.axis = .vertical
        self.alignment = .leading
        self.spacing = 8
        self.distribution = .equalSpacing
        self.itemNameLabel.font = .systemFont(ofSize: 20, weight: .regular)
        self.itemNameLabel.textColor = .AirbnbCustomColor.homeSubtitle.color
        self.itemNameLabel.textAlignment = .left
        self.priceLabel.font = .systemFont(ofSize: 17, weight: .regular)
        self.priceLabel.textColor = .AirbnbCustomColor.homeSubtitle.color
        self.priceLabel.textAlignment = .left
    }
    
    private func setLayout() {
        self.addArrangedSubview(wishInfoStackView)
        self.addArrangedSubview(itemNameLabel)
        self.addArrangedSubview(priceLabel)
    }
}
