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
                print(error?.localizedDescription ?? "None")
                return
            }
            self?.presenter?.openHomeVC()
        }
    }
}
