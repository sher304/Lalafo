//
//  DetailPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject{
    func viewDidLoad()
    
}

class DetailPresenter: DetailPresenterProtocol{
    weak var view: DetailView?
    var interactor: DetailInteractorProtocol
    var router: DetailRouterProtocol
    
    init(interactor: DetailInteractorProtocol, router: DetailRouterProtocol){
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(){
        let number = self.interactor.getRandomNum()
        view?.showNumber(number: number ?? 0)
    }
}
