//
//  CartPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol CartPresenterService{
    
    init(view: CartView)
}

class CartPresenter: CartPresenterService{
    
    private weak var view: CartView?
    
    required init(view: CartView) {
        self.view = view
    }
}
