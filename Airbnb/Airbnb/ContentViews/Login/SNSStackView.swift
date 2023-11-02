//
//  SNSStackView.swift
//  Airbnb
//
//  Created by Jason on 11/1/23.
//

import UIKit
import SnapKit

protocol LoginDelegate: AnyObject {}

final class SNSStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupAttributes()
        self.setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: LoginDelegate?
    
    private let titleLabel = UILabel()
    private let buttonStackView = UIStackView()
    private let githubLogoButton = UIButton()
    private let appleLogoButton = UIButton()
    private lazy var action = UIAction { [weak self] _ in
        self?.touchUpGithubLoginButton()
    }
    
    private func setupAttributes() {
        self.axis = .vertical
        self.alignment = .center
        self.spacing = 8
        self.distribution = .equalSpacing
        self.buttonStackView.axis = .vertical
        self.buttonStackView.alignment = .center
        self.buttonStackView.spacing = 8
        self.buttonStackView.distribution = .equalSpacing
        self.titleLabel.text = "SNS 계정으로 로그인하기"
        self.titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = .black
        self.githubLogoButton.setImage(UIImage(named: "Github"), for: .normal)
        self.appleLogoButton.setImage(UIImage(named: "Apple"), for: .normal)
        self.githubLogoButton.addTarget(self, action: #selector(touchUpGithubLoginButton), for: .touchUpInside)
    }
    
    private func setupLayout() {
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(buttonStackView)
        self.buttonStackView.addArrangedSubview(githubLogoButton)
        self.buttonStackView.addArrangedSubview(appleLogoButton)
        
        self.buttonStackView.snp.makeConstraints { make in
            make.width.equalTo(343.0)
            make.height.equalTo(120)
        }
    }
    
    @objc func touchUpGithubLoginButton() {
        LoginManager.shared.requestCodeToGithub()
    }
}
