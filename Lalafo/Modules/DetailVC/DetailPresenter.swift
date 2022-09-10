//
//  DetailPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol DetailPresenterService{
    
    init(view: DetailView)
}

class DetailPresenter: DetailPresenterService{
    
    private weak var view: DetailView?
    
    required init(view: DetailView) {
        self.view = view
    }
}
