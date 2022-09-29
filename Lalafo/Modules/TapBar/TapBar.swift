//
//  TapBar.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 25/9/22.
//

import UIKit
import SnapKit

class TapBar: UITabBarController {
    
    private lazy var middelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "homekit"), for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(middleTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        setupConstraints()
    }
    
//    private func middleButton(){
//        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2), y: -20, width: 60, height: 60))
//        middleButton.backgroundColor = .red
//        middleButton.setBackgroundImage(UIImage(systemName: "homekit"), for: .normal)
//        self.tabBar.addSubview(middleButton)
//        self.view.layoutIfNeeded()
//        middleButton.addTarget(self, action: #selector(middleTapped), for: .touchUpInside)
//    }
    
    private func setupConstraints(){
        self.tabBar.addSubview(middelButton)
        middelButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    @objc private func middleTapped(){
        let vc = DetailBuilder.build()
        self.selectedIndex = 1
    }
    

}
