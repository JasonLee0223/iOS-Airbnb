//
//  WishItemImageView.swift
//  Airbnb
//
//  Created by Jason on 10/31/23.
//

import UIKit
import SnapKit

final class WishItemImageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAttributes()
        self.setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let stackView = UIStackView()
    private let superHost = BadgeLabel(padding: UIEdgeInsets(top: 4.0, left: 8.0, bottom: 4.0, right: 8.0))
    private let heartEmoji = UIButton()
    private let wishItemImage = UIImageView()
    
    func configureOf(isHeartImoji: Bool) {
        if !isHeartImoji {
            self.heartEmoji.setImage(UIImage(named: "heartImoji"), for: .normal)
        }
    }
    
    func configureOf(isWishItem: Bool, image: UIImage) {
        if !isWishItem {
            self.wishItemImage.image = image
        }
    }
    
    private func setAttributes() {
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.stackView.spacing = 214
        self.stackView.distribution = .equalSpacing
        self.superHost.text = "슈퍼호스트"
        self.superHost.font = .systemFont(ofSize: 12, weight: .regular)
        self.superHost.backgroundColor = .white
        self.superHost.clipsToBounds = true
        self.superHost.layer.cornerRadius = 10
        self.heartEmoji.setImage(UIImage(named: "heartImoji"), for: .normal)
        self.wishItemImage.clipsToBounds = true
        self.wishItemImage.layer.cornerRadius = 10
        self.wishItemImage.image = UIImage(named: "firstWishImage")
    }
    
    private func setLayout() {
        self.stackView.addArrangedSubview(superHost)
        self.stackView.addArrangedSubview(heartEmoji)
        
        self.superHost.snp.makeConstraints { make in
            make.width.equalTo(73.0)
            make.height.equalTo(24.0)
        }
        self.heartEmoji.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
        self.addSubview(wishItemImage)
        self.addSubview(stackView)
        
        self.wishItemImage.snp.makeConstraints { make in
            make.centerX.centerY.width.height.equalToSuperview()
        }
        self.stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
        }
    }
}
