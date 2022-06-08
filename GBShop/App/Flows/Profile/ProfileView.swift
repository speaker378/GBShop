//
//  ProfileView.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import SnapKit
import UIKit

final class ProfileView: UIView {
    lazy var scrollView: UIScrollView = {
        return UIScrollView()
    }()
    
    lazy var contentView: UIView = {
        return UIView()
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.placeholder = "Login"
        return textField
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.placeholder = "Name"
        return textField
    }()
    
    lazy var lastnameTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.placeholder = "Lastname"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Password *"
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.placeholder = "email"
        return textField
    }()
    
    lazy var genderTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.placeholder = "Gender"
        return textField
    }()
    
    lazy var creditCardTextField: UITextField = {
        let textField = makeDefaultTextField()
        textField.placeholder = "Credit card"
        return textField
    }()
    
    lazy var bioTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.orange.cgColor
        textView.textColor = .gray
        return textView
    }()
    
    lazy var changeUserDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save changes", for: .normal)
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
    
    private func makeDefaultTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.textColor = .gray
        textField.textAlignment = .center
        return textField
    }
    
    private func configureViews() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(loginTextField)
        contentView.addSubview(nameTextField)
        contentView.addSubview(lastnameTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(changeUserDataButton)
        contentView.addSubview(genderTextField)
        contentView.addSubview(creditCardTextField)
        contentView.addSubview(bioTextView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let inset = 24
        let heightTextField = 40
        let heightTextView = 120
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(inset * 3)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        lastnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(lastnameTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        genderTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        creditCardTextField.snp.makeConstraints { make in
            make.top.equalTo(genderTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextField)
        }
        
        bioTextView.snp.makeConstraints { make in
            make.top.equalTo(creditCardTextField.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.height.equalTo(heightTextView)
        }
        
        changeUserDataButton.snp.makeConstraints { make in
            make.top.equalTo(bioTextView.snp.bottom).offset(inset)
            make.leading.equalTo(contentView).offset(inset)
            make.trailing.equalTo(contentView).offset(-inset)
            make.bottom.equalTo(scrollView).offset(-inset)
        }
    }
}
