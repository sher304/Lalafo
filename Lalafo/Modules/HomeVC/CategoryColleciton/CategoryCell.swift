//
//  CategoryCell.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 12/9/22.
//

import UIKit

class CategoryCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .orange
    }
}
