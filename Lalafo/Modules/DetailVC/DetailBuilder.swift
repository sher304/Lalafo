//
//  DetailBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit

class DetailBuilder{
    
    static func build() -> UIViewController{
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let vc = DetailViewController()
        vc.presenter = presenter
        presenter.view = vc
        router.detailVC = vc
        return vc
    }
}
