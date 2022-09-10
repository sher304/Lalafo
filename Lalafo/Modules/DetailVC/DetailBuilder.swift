//
//  DetailBuilder.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit

class DetailBuilder{
    
    static func build() -> UIViewController{
        let vc = DetailViewController()
        let presenter = DetailPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    
}
