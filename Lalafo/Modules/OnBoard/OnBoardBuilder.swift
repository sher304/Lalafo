//
//  OnBoardBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//
import UIKit


class OnBoardBuilder{
    
    static func build() -> UIViewController{
        let router = OnBoardRouter()
        let presenter = OnBoardPresenter(rotuer: router)
        let vc = OnBoardViewController()
        vc.presenter = presenter
        presenter.view = vc
        router.onBoardVC = vc
        return vc
    }
}
