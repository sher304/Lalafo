//
//  CartPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol CartPresenterService{
    
}

class CartPresenter: CartPresenterService{
    weak var view: CartView?
    
    var router: CartRouterProtocol
    var interactor: CartInteractorProtocol
    
    init(rotuer: CartRouterProtocol, interactor: CartInteractorProtocol){
        self.router = rotuer
        self.interactor = interactor
    }
}
