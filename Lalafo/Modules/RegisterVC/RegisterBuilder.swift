//
//  RegisterBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation
import UIKit


class RegisterBuilder {
    
    static func build() -> UIViewController{
        let router = RegisterRouter()
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter(router: router, interactor: interactor)
        let vc = RegisterViewController()
        presenter.view = vc
        vc.presenter = presenter
        router.regiseterVC = vc
        return vc
    }
}
