//
//  ProductCell.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 12/9/22.
//

import Foundation
import UIKit
import SnapKit


class ProductDetailCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.tintColor = .black
        return image
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.backgroundColor = .customBG
        
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
