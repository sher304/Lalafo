//
//  RegisterViewController.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 22/9/22.
//

import UIKit
import SnapKit

protocol RegisterView: AnyObject{
    func showError(message: String)
}

class RegisterViewController: UIViewController {
    
    var presenter: RegisterPresenterProtocol?
    
    
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
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .black
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var emailTF: UITextField = {
        let textF = UITextField()
        textF.textColor = .black
        textF.autocorrectionType = .no
        textF.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customGray]
        )
        textF.autocapitalizationType = .none
        return textF
    }()
    
    private lazy var emailUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var passwordTF: UITextField = {
        let textF = UITextField()
        textF.textColor = .black
        textF.autocorrectionType = .no
        textF.isSecureTextEntry = true
        textF.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customGray]
        )
        textF.autocapitalizationType = .none
        return textF
    }()
    
    
    private lazy var passwordUnderLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var abstractShapeOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shape-1")
        return image
    }()
    
    private lazy var abstractShapeTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shape-2")
        return image
    }()
    
    private lazy var abstractShapeThree: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shape-3")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        
        view.addSubview(abstractShapeOne)
        abstractShapeOne.snp.makeConstraints { make in
            make.top.equalTo(150)
            make.leading.equalTo(10)
        }
        
        view.addSubview(abstractShapeTwo)
        abstractShapeTwo.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.trailing.equalTo(-10)
        }
        
        view.addSubview(abstractShapeThree)
        abstractShapeThree.snp.makeConstraints { make in
            make.top.equalTo(abstractShapeTwo.snp.bottom)
            make.centerX.equalTo(abstractShapeTwo)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.top.equalTo(50)
        }
        
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.leading.equalTo(35)
            make.trailing.equalTo(-35)
            make.height.equalTo(55)
            make.bottom.equalTo(-120)
        }
        
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.centerY.equalToSuperview().offset(-60)
            make.trailing.equalTo(-60)
            make.height.equalTo(100)
        }
        
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
        }
        
        view.addSubview(emailUnderLine)
        emailUnderLine.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom)
            make.leading.equalTo(emailTF.snp.leading)
            make.trailing.equalTo(emailTF.snp.trailing)
            make.height.equalTo(1)
        }
        
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(45)
            make.top.equalTo(emailUnderLine.snp.bottom).offset(50)
        }
        
        view.addSubview(passwordUnderLine)
        passwordUnderLine.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom)
            make.leading.equalTo(passwordTF.snp.leading)
            make.trailing.equalTo(passwordTF.snp.trailing)
            make.height.equalTo(1)
        }
        
    }
    
    @objc private func didLoginTapped(){
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        presenter?.registerAccount(email: email, password: password)
    }
    
    @objc private func didBackTapped(){
        dismiss(animated: true, completion: nil)
    }
    
}


extension RegisterViewController: RegisterView{
    func showError(message: String){
        self.registerLabel.font = .systemFont(ofSize: 15, weight: .bold)
        self.registerLabel.text = message
    }
}
