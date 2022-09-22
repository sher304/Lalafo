//
//  RegisterPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation


protocol RegisterPresenterProtocol{
    func registerAccount(email: String, password: String)
    func openBoardVC()
    func errorShow(message: String)
}

class RegisterPresenter: RegisterPresenterProtocol{
    
    weak var view: RegisterView?
    
    var router: RegisterRouterProtocol
    var interactor: RegisterInteractorProtocol
    
    func registerAccount(email: String, password: String){
        interactor.registerAccount(email: email, password: password)
    }
    
    func openBoardVC(){
        router.openBoardVC()
    }
    
    func errorShow(message: String){
        view?.showError(message: message)
    }
    
    init(router: RegisterRouterProtocol, interactor: RegisterInteractorProtocol){
        self.router = router
        self.interactor = interactor
    }
}
