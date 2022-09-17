//
//  NetworkService.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 17/9/22.
//

import Foundation



class NetworkService{
    
    func getNetwork(completion: @escaping(Int) -> Void){
        completion(Int.random(in: 0...100))
    }
    
}
