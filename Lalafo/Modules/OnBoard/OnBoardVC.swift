//
//  OnBoardVC.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit
import SnapKit

protocol OnBoardView: AnyObject{
    
}

class OnBoardViewController: UIViewController {
    
    var presenter: OnBoardPresenterProtocol?
    
    private lazy var informLabel: UILabel = {
        let label = UILabel()
        label.text = "Solution of searching product from 2000"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "All that you need, All that you want just here at all!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .heavy)
        return label
    }()
    
    private lazy var regisetAccount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customGrayTint
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var loginAccount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.customDark, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .customDark
        
        view.addSubview(informLabel)
        informLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(120)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(informLabel.snp.bottom).offset(30)
            make.height.equalTo(240)
            make.width.equalTo(320)
        }
        
        view.addSubview(regisetAccount)
        regisetAccount.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.height.equalTo(55)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(130)
        }
        
        view.addSubview(loginAccount)
        loginAccount.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.height.equalTo(55)
            make.top.equalTo(regisetAccount.snp.bottom).offset(20)
        }
    }
    
    @objc func loginTapped(){
        presenter?.loginTapped()
    }
}

extension OnBoardViewController: OnBoardView{
    
}
