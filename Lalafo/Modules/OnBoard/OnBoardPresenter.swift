//
//  OnBoardPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol OnBoardPresenterProtocol{
    func loginTapped()
}

class OnBoardPresenter: OnBoardPresenterProtocol{
    
    weak var view: OnBoardView?
    
    var router: OnBoardRouterProtocol
    
    init(rotuer: OnBoardRouterProtocol){
        self.router = rotuer
    }
    
    func loginTapped() {
        router.openHomeVC()
    }
    
}
