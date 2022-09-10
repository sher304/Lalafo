//
//  HomeBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit


class HomeBuilder {
    
    static func build() -> UIViewController{
        let vc = HomeViewController()
        let presenter = HomePresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}
