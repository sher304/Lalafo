//
//  ViewController.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit
import SnapKit

protocol HomeView: AnyObject{
    
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstarints()
    }
    
    private func setupConstarints(){
        view.backgroundColor = .orange
    }
}


extension HomeViewController: HomeView{
    
}
