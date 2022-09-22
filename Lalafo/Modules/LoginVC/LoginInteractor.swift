//
//  LoginInteractor.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation
import FirebaseAuth

protocol LoginInteractorProtocol{
    func login(email: String, password: String)
}

class LoginInteractor: LoginInteractorProtocol{
    
    var presenter: LoginPresenterProtocol?
    
    func login(email: String, password: String){
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                self?.presenter?.showMessage(message: error?.localizedDescription ?? "Error")
                return
            }
            self?.presenter?.openHomeVC()
        }
    }
}
