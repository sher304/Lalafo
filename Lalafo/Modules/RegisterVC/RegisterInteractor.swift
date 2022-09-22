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
    
    var presenter: RegisterPresenterProtocol?
    
    
    func registerAccount(email: String, password: String){
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                self?.presenter?.errorShow(message: error?.localizedDescription ?? "None")
                return }
            self?.presenter?.openBoardVC()
        }
    }
}
