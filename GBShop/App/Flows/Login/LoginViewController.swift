//
//  LoginViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import UIKit
import FirebaseCrashlytics

final class LoginViewController: UIViewController {
    
    lazy var loginService: LoginRequestFactory = {
        return RequestFactory().makeLoginRequestFactory()
    }()
    
    private var loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "E-Shop"
        navigationController?.navigationBar.prefersLargeTitles = true
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        loginView.scrollView.addGestureRecognizer(hideKeyboardGesture)
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
        
        loginView.loginButton.addTarget(self, action: #selector(tapButtonLogin), for: .touchUpInside)
        loginView.registrationButton.addTarget(self, action: #selector(tapButtonRegistration), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func tapButtonLogin(sender _: UIButton) {
        let loginData = LoginRequest(
            login: loginView.loginTextField.text ?? "",
            password: loginView.passwordTextField.text ?? ""
        )
        guard validateLoginData(loginData) else {
            showMessage("fields cannot be empty", title: "Error")
            return
        }
        loginService.login(requestModel: loginData) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    if result.result == 1 {
                        CurrentUser.shared.user = result.user
                        Crashlytics.createLog(.loginSuccess)
                        self.successLogin()
                    } else {
                        Crashlytics.createLog(.loginFailure)
                        self.showMessage(result.errorMessage ?? "", title: "Error")
                    }
                case .failure(let error):
                    Crashlytics.createLog(.loginFailure)
                    self.showMessage(error.localizedDescription, title: "Error")
                }
            }
        }
    }
    
    @objc
    private func tapButtonRegistration(sender _: UIButton) {
        navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
    
    private func validateLoginData(_ data: LoginRequest) -> Bool {
        if data.login.isEmpty || data.password.isEmpty {
            return false
        }
        return true
    }
    
    private func showMessage(_ message: String, title: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func successLogin() {
        let viewController = TabBarViewController()
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true, completion: nil)
    }
    
    // MARK: keyboard
    @objc
    func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        loginView.scrollView.contentInset = contentInsets
        loginView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc
    func keyboardWillBeHidden(notification _: Notification) {
        let contentInsets = UIEdgeInsets.zero
        loginView.scrollView.contentInset = contentInsets
    }
    
    @objc
    func hideKeyboard() {
        loginView.scrollView.endEditing(true)
    }
}
