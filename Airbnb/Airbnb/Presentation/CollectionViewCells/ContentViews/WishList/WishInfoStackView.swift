//
//  WishInfoStackView.swift
//  Airbnb
//
//  Created by Jason on 10/31/23.
//

import UIKit
import SnapKit

final class WishInfoStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setAttributes()
        self.setLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private let starEmoji = UIButton()
    private let grade = UILabel()
    private let gradeCount = UILabel()
    
    func configureOfLabel(gradeText: String, gradeCountText: String) {
        self.grade.text = gradeText
        self.gradeCount.text = gradeCountText
    }
    
    private func setAttributes() {
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 4
        self.distribution = .equalSpacing
        self.starEmoji.setImage(UIImage(systemName: "star.fill"), for: .normal)
        self.starEmoji.tintColor = .red
        self.grade.font = .systemFont(ofSize: 12, weight: .regular)
        self.grade.textColor = .AirbnbCustomColor.homeSubtitle.color
        self.grade.textAlignment = .center
        self.gradeCount.font = .systemFont(ofSize: 12, weight: .regular)
        self.gradeCount.textColor = .AirbnbCustomColor.travelTime.color
        self.gradeCount.textAlignment = .center
    }
    
    private func setLayout() {
        self.addArrangedSubview(starEmoji)
        self.addArrangedSubview(grade)
        self.addArrangedSubview(gradeCount)
    }
}
