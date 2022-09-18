//
//  OnBoardBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//
import UIKit


class OnBoardBuilder{
    
    static func build() -> UIViewController{
        let vc = OnBoardViewController()
        let router = OnBoardRouter()
        let presenter = OnBoardPresenter(rotuer: router)
        vc.presenter = presenter
        return vc
    }
    
}
