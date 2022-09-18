//
//  HomeRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation
import Hero

protocol HomeRouterProtocol: AnyObject{
    func openDetailVC(number: Int)
    
}


class HomeRouter: HomeRouterProtocol{
    weak var homeVC: HomeViewController?
    
    func openDetailVC(number: Int){
        let vc = DetailBuilder.build(number: number)
        vc.hero.isEnabled = true
        vc.hero.modalAnimationType = .selectBy(presenting: .zoomSlide(direction: .down), dismissing: .zoomSlide(direction: .up))
        homeVC?.present(vc, animated: true, completion: nil)
    }
}
