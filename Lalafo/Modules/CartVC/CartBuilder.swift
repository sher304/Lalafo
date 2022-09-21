//
//  CartBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit


class CartBuilder{
    
    static func build() -> UIViewController{
        let router = CartRouter()
        let interactor = CartInteractor()
        let presenter = CartPresenter(rotuer: router, interactor: interactor)
        let vc = CartViewController()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
}
