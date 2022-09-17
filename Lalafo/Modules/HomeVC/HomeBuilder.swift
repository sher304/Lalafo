//
//  HomeBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit


class HomeBuilder {
    
    static func build() -> UIViewController{
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router)
        let vc = HomeViewController()
        vc.presenter = presenter
        presenter.view = vc
        interactor.presenter = presenter
        router.homeVC = vc
        return vc
    }
}
