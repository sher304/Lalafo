//
//  DetailBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit

class DetailBuilder{
    
    static func build(number: Int) -> UIViewController{
        let interactor = DetailInteractor(number: number)
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let vc = DetailViewController()
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
}
