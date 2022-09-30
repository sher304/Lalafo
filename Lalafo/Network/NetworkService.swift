//
//  NetworkService.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 17/9/22.
//

import Foundation
import FirebaseDatabase

class NetworkService{
    
//    func getNetwork(completion: @escaping(Int) -> Void){
//        completion(Int.random(in: 0...100))
//    }
    
    var ref: DatabaseReference?

    func getNetworkData(){
        ref?.child("products/1").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return
          }
            let userName = snapshot?.value as? String ?? "Unknown"
            print(userName)
        })
    }
}
