//
//  ReservationController.swift
//  Airbnb
//
//  Created by Jason on 10/10/23.
//

import UIKit

final class ReservationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private let bottomLineView: UIView = UIView(frame: .zero)
    private let titleView: UILabel = UILabel()
    
    private func setupUI() {
        self.setAttributes()
        self.setLayout()
    }
    
    private func setAttributes() {
        self.view.backgroundColor = .white
        self.titleView.text = "예약"
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
