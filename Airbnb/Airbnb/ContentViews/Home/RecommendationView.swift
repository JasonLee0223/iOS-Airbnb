//
//  RecommendationView.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit
import SnapKit

final class RecommendationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupAttributes()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureOfImageView(by imageName: String) {
        let image = UIImage(named: imageName)
        self.imageView.image = image
    }
    
    func configureOfLabelText(summaryText: String) {
        self.summaryLabel.text = summaryText
    }
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let summaryLabel = UILabel()
    
    private func setupAttributes() {
        self.stackView.axis = .vertical
        self.stackView.alignment = .leading
        self.stackView.spacing = 16
        self.stackView.distribution = .equalSpacing
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleToFill
        self.summaryLabel.numberOfLines = 2
        self.summaryLabel.textColor = .AirbnbCustomColor.homeSubtitle.color
        self.summaryLabel.textAlignment = .left
        self.summaryLabel.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    private func setupLayout() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(summaryLabel)
        self.stackView.snp.makeConstraints { make in
            make.centerX.centerY.width.height.equalToSuperview()
        }
    }
}
