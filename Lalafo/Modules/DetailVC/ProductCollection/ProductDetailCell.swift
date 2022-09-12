//
//  ProductCell.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 12/9/22.
//

import Foundation
import UIKit


class ProductDetailCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.backgroundColor = .orange
    }
    
}
