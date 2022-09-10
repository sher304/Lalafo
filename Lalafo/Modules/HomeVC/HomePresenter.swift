//
//  Presenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol HomePresenterService{
    
    
    init(view: HomeView)
}

class HomePresenter: HomePresenterService{
    
    private weak var view: HomeView?
    
    required init(view: HomeView) {
        self.view = view
    }
}
