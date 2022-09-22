//
//  LoginBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation
import UIKit


class LoginBuilder{
    
    static func build() -> UIViewController{
        let rotuer = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(router: rotuer, interactor: interactor)
        let vc = LoginViewController()
        presenter.view = vc
        interactor.presenter = presenter
        vc.presenter = presenter
        rotuer.loginVC = vc
        return vc
    }
}
