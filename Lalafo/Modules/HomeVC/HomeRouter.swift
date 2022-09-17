//
//  HomeRouter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol HomeRouterProtocol: AnyObject{
    func openDetailVC(number: Int)
    
}


class HomeRouter: HomeRouterProtocol{
    weak var homeVC: HomeViewController?
    
    func openDetailVC(number: Int){
        let vc = DetailBuilder.build(number: number)
        homeVC?.present(vc, animated: true, completion: nil)
    }
    
    
}
