//
//  HeaderView.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit

class HeaderView: UICollectionReusableView, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupAttributes()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeaderText(text: String? = nil) {
        self.title.text = text
    }
    
    private var title = UILabel()
    
    private func setupAttributes() {
        self.title.textColor = .AirbnbCustomColor.homeMaintitle.color
        self.title.textAlignment = .left
        self.title.numberOfLines = 2
        self.title.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    private func setupLayout() {
        self.addSubview(title)
        self.title.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
