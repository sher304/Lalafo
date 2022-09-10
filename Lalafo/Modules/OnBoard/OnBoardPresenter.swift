//
//  OnBoardPresenter.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import Foundation

protocol OnBoardPresenterService{
    
    init(view: OnBoardView)
}

class OnBoardPresenter: OnBoardPresenterService{
    
    private weak var view: OnBoardView?
    
    required init(view: OnBoardView) {
        self.view = view
    }
}
