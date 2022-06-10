//
//  LoginView.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import SnapKit
import UIKit

final class LoginView: UIView {
    lazy var scrollView: UIScrollView = {
        return UIScrollView()
    }()
    
    lazy var contentView: UIView = {
        return UIView()
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cart")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.textColor = .gray
        textField.textAlignment = .center
        textField.accessibilityIdentifier = "login"
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.textColor = .gray
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.accessibilityIdentifier = "password"
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.accessibilityIdentifier = "login button"
        return button
    }()
    
    lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registration", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViews()
    }
    
    private func configureViews() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginLabel)
        contentView.addSubview(loginTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(registrationButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let inset = 24
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.centerX.lessThanOrEqualTo(contentView)
            make.width.equalTo(scrollView).multipliedBy(0.3)
            make.height.equalTo(100)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(100)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginTextField.snp.top).offset(-5)
            make.leading.equalTo(contentView).offset(inset + 5)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(inset + 5)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(40)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.bottom.equalTo(scrollView).offset(-inset)
        }
    }
}
