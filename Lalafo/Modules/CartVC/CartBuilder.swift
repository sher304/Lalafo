//
//  CartBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit


class CartBuilder{
    
    static func build() -> UIViewController{
        let vc = CartViewController()
        let presenter = CartPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}
