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
        let presenter = CartPresenter(rotuer: router)
        let vc = CartViewController()
        presenter.view = vc
        vc.presenter = presenter
        return vc
    }
}
