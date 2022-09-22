//
//  RegisterRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import Foundation
import Hero

protocol RegisterRouterProtocol{
    func openBoardVC()
    
}

class RegisterRouter: RegisterRouterProtocol{
    weak var regiseterVC: RegisterViewController?
    
    func openBoardVC(){
        let vc = OnBoardBuilder.build()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .zoomOut
        regiseterVC?.present(vc, animated: true, completion: nil)
    }
    
}
