//
//  PosterView.swift
//  Airbnb
//
//  Created by Jason on 10/20/23.
//

import UIKit
import SnapKit

final class PosterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupAttributes()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backgroundView = UIImageView(image: .init(named: "mainImage"))
    private let stackView = UIStackView()
    private let mainTitle = UILabel()
    private let subTitle = UILabel()
    private let badge = BadgeLabel(padding: UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0))
    
    private func setupAttributes() {
        self.backgroundView.contentMode = .scaleToFill
        self.backgroundView.clipsToBounds = true
        self.stackView.axis = .vertical
        self.stackView.spacing = 16
        self.stackView.alignment = .leading
        self.stackView.distribution = .equalSpacing
        self.mainTitle.text = "슬기로운 \n자연생활"
        self.subTitle.text = "에어비앤비가 엄선한 \n위시리스트를 만나보세요."
        self.badge.text = "여행 아이디어 얻기"
        self.mainTitle.textAlignment = .left
        self.subTitle.textAlignment = .left
        self.badge.textAlignment = .center
        self.mainTitle.numberOfLines = 2
        self.subTitle.numberOfLines = 2
        self.mainTitle.textColor = .AirbnbCustomColor.homeMaintitle.color
        self.subTitle.textColor = .AirbnbCustomColor.homeSubtitle.color
        self.badge.textColor = .AirbnbCustomColor.homeBadge.color
        self.mainTitle.font = .systemFont(ofSize: 34, weight: .medium)
        self.subTitle.font = .systemFont(ofSize: 17, weight: .regular)
        self.badge.font = .systemFont(ofSize: 17, weight: .regular)
        self.mainTitle.backgroundColor = .clear
        self.subTitle.backgroundColor = .clear
        self.badge.backgroundColor = .AirbnbCustomColor.homeSubtitle.color
        self.badge.layer.masksToBounds = true
        self.badge.layer.cornerRadius = 15
    }
    
    private func setupLayout() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.stackView)
        self.backgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        self.stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        self.stackView.addArrangedSubview(mainTitle)
        self.stackView.addArrangedSubview(subTitle)
        self.stackView.addArrangedSubview(badge)
    }
}
