//
//  RegistrationViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 21.04.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    lazy var registrationService: RegistrationRequestFactory = {
        return RequestFactory().makeRegistrationRequestFactory()
    }()
    
    private var registrationView = RegistrationView()
    
    override func loadView() {
        super.loadView()
        view = registrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
        navigationController?.navigationBar.prefersLargeTitles = true
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        registrationView.scrollView.addGestureRecognizer(hideKeyboardGesture)
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
        registrationView.registrationButton.addTarget(self, action: #selector(tapButtonRegistration), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func tapButtonRegistration(sender _: UIButton) {
        let userData = RegistrationRequest(
            login: registrationView.loginTextField.text ?? "",
            name: registrationView.nameTextField.text ?? "",
            lastName: registrationView.lastnameTextField.text ?? "",
            password: registrationView.passwordTextField.text ?? "",
            email: registrationView.emailTextField.text ?? "",
            gender: registrationView.genderTextField.text ?? "",
            creditCard: registrationView.creditCardTextField.text ?? "",
            bio: registrationView.bioTextView.text ?? ""
        )
        guard validateUserData(userData) else {
            showMessage("the fields with * are required to be filled in", title: "Error")
            return
        }
        registrationService.registration(user: userData) { [weak self] response in
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
    
    private func validateUserData(_ data: RegistrationRequest) -> Bool {
        if data.login.isEmpty || data.email.isEmpty || data.password.isEmpty {
            return false
        }
        return true
    }
    
    // MARK: keyboard
    @objc
    func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        registrationView.scrollView.contentInset = contentInsets
        registrationView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc
    func keyboardWillBeHidden(notification _: Notification) {
        let contentInsets = UIEdgeInsets.zero
        registrationView.scrollView.contentInset = contentInsets
    }
    
    @objc
    func hideKeyboard() {
        registrationView.scrollView.endEditing(true)
    }
}
