//
//  LoginPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation

protocol LoginPresenterProtocol{
    func didLoginTapped()
}

class LoginPresenter: LoginPresenterProtocol{
    
    weak var view: LoginViewController?
    
    var router: LoginRouterProtocol
    var interactor: LoginInteractorProtocol
    
    
    init(router: LoginRouterProtocol, interactor: LoginInteractorProtocol){
        self.router = router
        self.interactor = interactor
    }
    
    func didLoginTapped(){
        router.openHomeVC()
    }
}
