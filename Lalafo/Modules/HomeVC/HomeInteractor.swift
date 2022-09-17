//
//  HomeInteractor.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 17/9/22.
//

import Foundation


protocol HomeInteractorProtocol: AnyObject{
    func loadData()
    func loadNetwork()
    
    var number: Int { get }
    
}

class HomeInteractor: HomeInteractorProtocol{
    
    weak var presenter: HomePresenterProtocol?
    let dataService = DataService()
    let networkService = NetworkService()
    
    var number: Int = 0
    
    func loadData() {
        dataService.getData { [weak self] data in
            self?.presenter?.didLoadData(date: data)
        }
    }
    
    func loadNetwork() {
        networkService.getNetwork { number in
            self.presenter?.didLoadNetwork(number: number)
            self.number = number
        }
    }
    
    
    
}
