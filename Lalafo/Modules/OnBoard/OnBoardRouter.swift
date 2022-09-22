//
//  OnBoardRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation
import Hero

protocol OnBoardRouterProtocol{
    func openLoginVC()
    func openRegisterVC()
}

class OnBoardRouter: OnBoardRouterProtocol{
    weak var onBoardVC: OnBoardViewController?
    
    func openLoginVC(){
        let vc = LoginBuilder.build()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        onBoardVC?.present(vc, animated: true, completion: nil)
    }
    
    func openRegisterVC(){
        let vc = RegisterBuilder.build()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        onBoardVC?.present(vc, animated: true, completion: nil)
    }
}

