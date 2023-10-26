//
//  TravelListView.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit
import SnapKit

final class TravelListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupAttributes()
        self.setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainStackView = UIStackView()
    private let subStackView = UIStackView()
    private let imageView = UIImageView()
    private let travelNameLabel = UILabel()
    private let travelTimeLabel = UILabel()
    
    func configureOfImageView(by imageName: String) {
        guard let image = self.imageView.setImageURL(imageName: imageName) else {
            return
        }
        self.imageView.image = image
    }
    
    func configureOfLabelText(travelName: String, travelTime: String) {
        self.travelNameLabel.text = travelName
        self.travelTimeLabel.text = travelTime
    }
    
    private func setupAttributes() {
        self.mainStackView.axis = .horizontal
        self.mainStackView.spacing = 16
        self.mainStackView.alignment = .center
        self.mainStackView.distribution = .fill
        self.subStackView.axis = .vertical
        self.subStackView.spacing = 4
        self.subStackView.alignment = .leading
        self.subStackView.distribution = .equalSpacing
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
        self.travelNameLabel.textColor = .AirbnbCustomColor.travelName.color
        self.travelTimeLabel.textColor = .AirbnbCustomColor.travelTime.color
        self.travelNameLabel.textAlignment = .left
        self.travelTimeLabel.textAlignment = .left
        self.travelNameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        self.travelTimeLabel.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    private func setupLayout() {
        self.addSubview(mainStackView)
        self.mainStackView.addArrangedSubview(imageView)
        self.mainStackView.addArrangedSubview(subStackView)
        self.subStackView.addArrangedSubview(travelNameLabel)
        self.subStackView.addArrangedSubview(travelTimeLabel)
        self.mainStackView.snp.makeConstraints { make in
            make.centerX.centerY.width.height.equalToSuperview()
        }
    }
}
