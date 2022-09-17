//
//  Presenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject{
    func viewDidLoad()
    func didLoadData(date: Date)
    func didLoadNetwork(number: Int)
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
    
    func didLoadNetwork(number: Int){
        view?.showNetwork(number: number.description)
    }
    
    func didLoadData(date: Date){
        view?.showDate(date: date.description)
    }
    
    func didTapped(){
        let number = self.interactor.number
        router.openDetailVC(number: number)
    }
}
