//
//  CategoryCell.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 12/9/22.
//

import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var categoryImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    private lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.text = "Best Deal"
        label.textColor = .customGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.backgroundColor = .white
        
        contentView.addSubview(categoryImage)
        categoryImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(20)
            make.width.height.equalTo(40)
        }
        
        contentView.addSubview(categoryTitle)
        categoryTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
    }
}
