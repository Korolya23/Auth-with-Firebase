//
//  RegController.swift
//  App
//
//  Created by Artem on 8.02.25.
//

import UIKit

class RegController: UIViewController {
    
    let titleText = UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let regButton = UIButton(type: .system)
    let logButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        regSetup()
    }
    
    private func regSetup() {
        titleText.text = "Регистрация"
        titleText.font = UIFont.boldSystemFont(ofSize: 24)
        titleText.textAlignment = .center
        titleText.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 40)
        view.addSubview(titleText)
        
        usernameField.placeholder = "Введите почту"
        usernameField.borderStyle = .roundedRect
        usernameField.backgroundColor = UIColor.systemGray6
        usernameField.layer.borderColor = UIColor.black.cgColor
        usernameField.layer.cornerRadius = 5
        usernameField.layer.borderWidth = 1
        usernameField.frame = CGRect(x: 20, y: 160, width: view.frame.width - 40, height: 50)
        view.addSubview(usernameField)
        
        passwordField.placeholder = "Напишите пароль"
        passwordField.backgroundColor = UIColor.systemGray6
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .roundedRect
        passwordField.layer.borderColor = UIColor.black.cgColor
        passwordField.layer.cornerRadius = 5
        passwordField.layer.borderWidth = 1
        passwordField.frame = CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 50)
        view.addSubview(passwordField)
        
        regButton.setTitle("Зарегистрироваться", for: .normal)
        regButton.backgroundColor = UIColor.black
        regButton.setTitleColor(.white, for: .normal)
        regButton.layer.cornerRadius = 5
        regButton.frame = CGRect(x: 20, y: 300, width: view.frame.width - 40, height: 50)
        regButton.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
        view.addSubview(regButton)
        
        logButton.setTitle("Уже есть аккаунт? Войти", for: .normal)
        logButton.frame = CGRect(x: 0, y: 360, width: view.frame.width, height: 30)
        logButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(logButton)
    }
    
    @objc private func regButtonTapped() {
        guard let email = usernameField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Пожалуйста, введите логин и пароль.")
            return
        }
        // Используем AuthService для регистрации
        AuthService.shared.registerUser(email: email, password: password) { error in
            if let error = error {
                print("Ошибка регистрации: \(error.localizedDescription)")
                return
            }
            // Успешная регистрация, переходим на страницу логина
            let loginVC = LogController()
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        
    }
        
        @objc private func loginButtonTapped() {
            // Переходим на главный экран после логина
            navigationController?.popViewController(animated: true)
    }
}
