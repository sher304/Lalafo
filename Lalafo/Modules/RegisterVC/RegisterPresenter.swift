//
//  RegisterPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation


protocol RegisterPresenterProtocol{
    func registerAccount(email: String, password: String)
}

class RegisterPresenter: RegisterPresenterProtocol{
    
    weak var view: RegisterView?
    
    var router: RegisterRouterProtocol
    var interactor: RegisterInteractorProtocol
    
    func registerAccount(email: String, password: String){
        interactor.registerAccount(email: email, password: password)
    }
    
    init(router: RegisterRouterProtocol, interactor: RegisterInteractorProtocol){
        self.router = router
        self.interactor = interactor
    }
}
