//
//  PosterCell.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import UIKit
import SnapKit

final class PosterCell: UICollectionViewCell, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let posterView = PosterView(frame: CGRect(origin: .zero, size: CGSize(width: 390, height: 375)))
    
    private func setLayout() {
        self.addSubview(posterView)
    }
}
