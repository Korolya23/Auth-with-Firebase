//
//  ServiceAuth.swift
//  App
//
//  Created by Artem on 9.02.25.
//

import Firebase
import FirebaseAuth

class AuthService {
    static let shared = AuthService()

    private init() {}

    // Метод для регистрации пользователя
    func registerUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            completion(error)
        }
    }

    // Метод для входа пользователя
    func loginUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completion(error)
        }
    }

    // Метод для проверки состояния аутентификации
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }

    // Метод для выхода пользователя
    func logoutUser(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
}
