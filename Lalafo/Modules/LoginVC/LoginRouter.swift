//
//  LoginRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation
import Hero


protocol LoginRouterProtocol{
    func openHomeVC()
}

class LoginRouter: LoginRouterProtocol{
    
    weak var loginVC: LoginViewController?
    
    func openHomeVC() {
        let vc = TapBar()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .zoom
        loginVC?.present(vc, animated: true, completion: nil)
    }
}
