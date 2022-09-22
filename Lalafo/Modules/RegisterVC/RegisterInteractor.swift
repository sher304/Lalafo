//
//  RegisterInteractor.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation
import FirebaseAuth

protocol RegisterInteractorProtocol: AnyObject{
    func registerAccount(email: String, password: String)
}

class RegisterInteractor: RegisterInteractorProtocol{
    
    func registerAccount(email: String, password: String){
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "None")
                return }
        }
    }
}
