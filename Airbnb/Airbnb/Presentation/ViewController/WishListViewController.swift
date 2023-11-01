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
    private let scrollView = WishScrollView(frame: .zero)
    
    private func setAttributes() {
        self.view.backgroundColor = .white
        self.titleView.text = "위시리스트"
        self.titleView.font = .systemFont(ofSize: 17, weight: .semibold)
        self.titleView.textColor = .AirbnbCustomColor.homeMaintitle.color
        self.titleView.sizeToFit()
        self.bottomLineView.backgroundColor = .AirbnbCustomColor.bottomLineView.color
        self.navigationItem.titleView = self.titleView
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
    }
    
    private func setLayout() {
        self.view.addSubview(self.bottomLineView)
        self.bottomLineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(1.0)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { make in
            make.centerX.centerY.width.equalToSuperview()
            make.top.equalTo(self.bottomLineView.snp.bottomMargin).offset(40)
        }
    }
}
