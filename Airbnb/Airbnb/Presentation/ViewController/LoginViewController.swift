//
//  LoginViewController.swift
//  Airbnb
//
//  Created by Jason on 11/1/23.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController, LoginDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.snsStackView.delegate = self
    }
    
    private let snsStackView = SNSStackView(frame: .zero)
    
    private func setupUI() {
        self.setupAttributes()
        self.setupLayout()
    }
    
    private func setupAttributes() {
        self.view.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.view.addSubview(snsStackView)
        self.snsStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(170)
        }
    }
}
