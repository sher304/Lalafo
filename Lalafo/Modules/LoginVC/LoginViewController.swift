//
//  LoginViewController.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import UIKit
import SnapKit

protocol LoginView: AnyObject{
    
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(didBackTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .customDark
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.top.equalTo(40)
        }
        
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(55)
            make.bottom.equalTo(-70)
        }
    }
    
    @objc private func didLoginTapped(){
        presenter?.didLoginTapped()
    }
    
    @objc private func didBackTapped(){
        dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController: LoginView{
    
}
