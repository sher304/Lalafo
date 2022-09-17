//
//  DetailInteractor.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 17/9/22.
//

import Foundation


protocol DetailInteractorProtocol: AnyObject{
    func getRandomNum() -> Int?
}


class DetailInteractor: DetailInteractorProtocol{
    let number: Int
    
    init(number: Int){
        self.number = number
    }
    
    func getRandomNum() -> Int? {
        if number < 100{
            return 14000
        }else{
            return 2400
        }
    }
}
