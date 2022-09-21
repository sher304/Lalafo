//
//  CartVC.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit

protocol CartView: AnyObject{
    
    
}

class CartViewController: UIViewController {
    
    var presenter: CartPresenterService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        view.backgroundColor = .blue
    }
}

extension CartViewController: CartView{
    
}
