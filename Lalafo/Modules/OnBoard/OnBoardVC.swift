//
//  OnBoardVC.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit

protocol OnBoardView: AnyObject{
    
}

class OnBoardViewController: UIViewController {
    
    var presenter: OnBoardPresenterService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        view.backgroundColor = .brown
    }
}

extension OnBoardViewController: OnBoardView{
    
    
    
}
