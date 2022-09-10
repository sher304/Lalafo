//
//  DetailViewController.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit
protocol DetailView: AnyObject{
    
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterService!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .green
    }
    
}


extension DetailViewController: DetailView{
    
}
