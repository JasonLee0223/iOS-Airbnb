//
//  WishScrollView.swift
//  Airbnb
//
//  Created by Jason on 11/1/23.
//

import UIKit
import SnapKit

final class WishScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAttributes()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let contentView = UIView()
    private let stackView = UIStackView(frame: .zero)
    private let wishItemImageView = WishItemImageView(frame: .zero)
    private let wishItemView = WishInfoView(frame: .zero)
    
    private func setAttributes() {
        self.stackView.axis = .vertical
        self.stackView.spacing = 4
        self.stackView.alignment = .center
        self.stackView.distribution = .equalSpacing
        
        self.wishItemImageView.configureOf(isHeartImoji: true)
        self.wishItemImageView.configureOf(isWishItem: true, image: UIImage(named: "firstWishImage") ?? UIImage())
        self.wishItemView.configureOfLabel(gradeText: "4.98", gradeCountText: "(후기 50개)")
        self.wishItemView.configureOfLabel(itemNameText: "비담집, 비우고담은집(집전체, 최대4인)", priceText: "₩308,571 / 박")
    }
    
    private func setLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.centerX.centerY.width.equalToSuperview()
        }
        self.contentView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.wishItemImageView)
        self.stackView.addArrangedSubview(self.wishItemView)
        
        self.stackView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(343)
            make.height.equalTo(320)
        }

        self.wishItemImageView.snp.makeConstraints { make in
            make.leading.trailing.width.equalToSuperview()
        }

        self.wishItemView.snp.makeConstraints { make in
            make.leading.trailing.width.equalToSuperview()
        }
    }
}
