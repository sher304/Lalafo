//
//  DetailRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation
import Hero

protocol DetailRouterProtocol: AnyObject{
    func openCartVC()
}

class DetailRouter: DetailRouterProtocol{
    
    weak var detailVC: DetailViewController?
    
    func openCartVC(){
        let vc = CartBuilder.build()
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .down), dismissing: .zoomSlide(direction: .up))
        detailVC?.present(vc, animated: true, completion: nil)
    }
}
