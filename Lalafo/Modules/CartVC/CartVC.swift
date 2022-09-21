//
//  CartVC.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit
import SnapKit

protocol CartView: AnyObject{
    
    
}

class CartViewController: UIViewController {
    
    var presenter: CartPresenterService?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(didBackTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()   
    }
    
    private func setupConstraints(){
        view.backgroundColor = .blue
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.top.equalTo(10)
        }
    }
    
    @objc private func didBackTapped(){
        dismiss(animated: true, completion: nil)
    }
}

extension CartViewController: CartView{
    
}
