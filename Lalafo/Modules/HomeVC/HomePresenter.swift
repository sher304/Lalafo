//
//  Presenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject{
    func viewDidLoad()
    func didTapped()
    
}

class HomePresenter: HomePresenterProtocol{
    
    
    weak var view: HomeView?
    var router: HomeRouterProtocol
    var interactor: HomeInteractor
    
    init(interactor: HomeInteractor, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.loadData()
        interactor.loadNetwork()
    }
    
    func didTapped(){
        router.openDetailVC()
    }
}
