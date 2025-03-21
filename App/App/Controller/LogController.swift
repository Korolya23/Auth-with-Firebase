//
//  LogController.swift
//  App
//
//  Created by Artem on 8.02.25.
//

import UIKit

class LogController: UIViewController {

    let titleLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let regButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        // Заголовок
        titleLabel.text = "Вход в систему"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 40)
        view.addSubview(titleLabel)

        // Поле для ввода имени пользователя
        usernameTextField.placeholder = "Введите почту"
        usernameTextField.backgroundColor = UIColor.systemGray6
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.frame = CGRect(x: 20, y: 160, width: view.frame.width - 40, height: 50)
        view.addSubview(usernameTextField)

        // Поле для ввода пароля
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = UIColor.systemGray6
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.frame = CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 50)
        view.addSubview(passwordTextField)

        // Кнопка для входа
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = UIColor.black
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.frame = CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 50)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        regButton.setTitle("Зарегистрироваться", for: .normal)
        regButton.frame = CGRect(x: 0, y: 360, width: view.frame.width, height: 30)
        regButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        view.addSubview(regButton)
    }

    @objc private func loginButtonTapped() {
        // Переходим на главный экран после логина
        guard let email = usernameTextField.text, !email.isEmpty,
                      let password = passwordTextField.text, !password.isEmpty else {
                    print("Пожалуйста, введите логин и пароль.")
                    return
                }
                
                // Используем AuthService для входа
                AuthService.shared.loginUser(email: email, password: password) { error in
                    if let error = error {
                        print("Ошибка входа: \(error.localizedDescription)")
                        return
                    }
                    // Успешный вход, переходим на главный экран
                    let homeVC = ViewController()
                    self.navigationController?.setViewControllers([homeVC], animated: true)
                }
    }
    
    @objc private func registerButtonTapped() {
            let registerVC = RegController()
            navigationController?.pushViewController(registerVC, animated: true)
        }
}
