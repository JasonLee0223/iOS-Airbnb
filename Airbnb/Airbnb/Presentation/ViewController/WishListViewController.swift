//
//  WishListViewController.swift
//  Airbnb
//
//  Created by Jason on 10/10/23.
//

import UIKit
import SnapKit

final class WishListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.setAttributes()
        self.setLayout()
    }
    
    private let titleView: UILabel = UILabel()
    private let bottomLineView: UIView = UIView(frame: .zero)
    
    private func setAttributes() {
        
        self.view.backgroundColor = .white
        self.titleView.text = "위시리스트"
        self.titleView.font = .systemFont(ofSize: 17, weight: .semibold)
        self.titleView.textColor = .AirbnbCustomColor.homeMaintitle.color
        self.titleView.sizeToFit()
        self.navigationItem.titleView = self.titleView
        
        bottomLineView.backgroundColor = .AirbnbCustomColor.bottomLineView.color
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.addSubview(bottomLineView)
    }
    
    private func setLayout() {
        self.bottomLineView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
        
    }
}
