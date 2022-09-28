//
//  TapBar.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 25/9/22.
//

import UIKit
import SnapKit

class TapBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
    }
    
    private func middleButton(){
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2), y: -20, width: 60, height: 60))
        middleButton.setBackgroundImage(UIImage(systemName: "homekit"), for: .normal)
        self.tabBar.addSubview(middleButton)
        self.view.layoutIfNeeded()
        middleButton.addTarget(self, action: #selector(middleTapped), for: .touchUpInside)
    }
    
    @objc private func middleTapped(){
        let vc = DetailBuilder.build()
        self.selectedIndex = 1
    }
    
    
}
