//
//  ProfileViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    lazy var changeUserDataService: ChangeUserDataRequestFactory = {
        return RequestFactory().makeChangeUserDataFactory()
    }()
    
    private var profileView = ProfileView()
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        profileView.scrollView.addGestureRecognizer(hideKeyboardGesture)
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        profileView.changeUserDataButton.addTarget(self, action: #selector(tapButtonChangeUserData), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func tapButtonChangeUserData(sender _: UIButton) {
        let userData = ChangeUserDataRequest(
            id: CurrentUser.shared.user!.id,
            login: profileView.loginTextField.text ?? "",
            name: profileView.nameTextField.text ?? "",
            lastName: profileView.lastnameTextField.text ?? "",
            password: profileView.passwordTextField.text ?? "",
            email: profileView.emailTextField.text ?? "",
            gender: profileView.genderTextField.text ?? "",
            creditCard: profileView.creditCardTextField.text ?? "",
            bio: profileView.bioTextView.text ?? ""
        )
        guard validateUserData(userData) else {
            showMessage("enter the password", title: "Error")
            return
        }
        changeUserDataService.change(user: userData) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    if result.result == 1 {
                        self.showMessage(result.userMessage ?? "", title: "Success")
                    } else {
                        self.showMessage(result.errorMessage ?? "", title: "Error")
                    }
                case .failure(let error):
                    self.showMessage(error.localizedDescription, title: "Error")
                }
            }
        }
    }
    
    private func showMessage(_ message: String, title: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func validateUserData(_ data: ChangeUserDataRequest) -> Bool {
        if data.password.isEmpty {
            return false
        }
        return true
    }
    
    private func configureViews() {
        guard let userData = CurrentUser.shared.user else { return }
        profileView.loginTextField.text = userData.login
        profileView.nameTextField.text = userData.name
        profileView.lastnameTextField.text = userData.lastName
        profileView.emailTextField.text = userData.email
        profileView.creditCardTextField.text = userData.creditCard
        profileView.genderTextField.text = userData.gender
        profileView.bioTextView.text = userData.bio
    }
    
    // MARK: keyboard
    @objc
    func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        profileView.scrollView.contentInset = contentInsets
        profileView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc
    func keyboardWillBeHidden(notification _: Notification) {
        let contentInsets = UIEdgeInsets.zero
        profileView.scrollView.contentInset = contentInsets
    }
    
    @objc
    func hideKeyboard() {
        profileView.scrollView.endEditing(true)
    }
}
