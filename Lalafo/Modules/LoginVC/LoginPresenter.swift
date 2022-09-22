//
//  LoginPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation

protocol LoginPresenterProtocol{
    func didLoginTapped(email: String, password: String)
    func openHomeVC()
}

class LoginPresenter: LoginPresenterProtocol{
    
    weak var view: LoginViewController?
    
    var router: LoginRouterProtocol
    var interactor: LoginInteractorProtocol
    
    
    init(router: LoginRouterProtocol, interactor: LoginInteractorProtocol){
        self.router = router
        self.interactor = interactor
    }
    
    func didLoginTapped(email: String, password: String){
        interactor.login(email: email, password: password)
    }
    
    func openHomeVC(){
        router.openHomeVC()
    }
}
