//
//  ViewController.swift
//  App
//
//  Created by Artem on 6.02.25.
//

import UIKit

class ViewController: UIViewController {
    
    let homeLable = UILabel()
    let logoutButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        presenceHome()
    }
    
    private func presenceHome () {
        homeLable.text = "Главный экран"
        homeLable.font = UIFont.boldSystemFont(ofSize: 24)
        homeLable.textAlignment = .center
        homeLable.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 40)
        view.addSubview(homeLable)
        
        logoutButton.setTitle("Выйти", for: .normal)
        logoutButton.backgroundColor = UIColor.black
        logoutButton.layer.cornerRadius = 5
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.frame = CGRect(x: 20, y: 740, width: view.frame.width - 40, height: 50)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        view.addSubview(logoutButton)
    }
    
    @objc private func logoutButtonTapped() {
        AuthService.shared.logoutUser { error in
            if let error = error {
                print("Ошибка выхода: \(error.localizedDescription)")
                return
            }
            // Возвращаемся на экран логина
            let loginVC = LogController()
            self.navigationController?.setViewControllers([loginVC], animated: true)
        }
    }
}
