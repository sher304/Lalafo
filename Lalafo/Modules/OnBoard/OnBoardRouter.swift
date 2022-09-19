//
//  OnBoardRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation
import Hero

protocol OnBoardRouterProtocol{
    func openHomeVC()
}

class OnBoardRouter: OnBoardRouterProtocol{
    weak var onBoardVC: OnBoardViewController?
    
    func openHomeVC(){
        print("tapped3")
        let vc = HomeBuilder.build()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .zoom
        onBoardVC?.present(vc, animated: true, completion: nil)
    }
}
