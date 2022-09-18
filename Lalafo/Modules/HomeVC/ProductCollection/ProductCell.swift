//
//  ProductCell.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 12/9/22.
//

import UIKit
import SnapKit


class ProductCell: UICollectionViewCell {
 
    static let identifier = "CustomCell"
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 14
        image.layer.masksToBounds = true
        image.image = UIImage(systemName: "person.fill")
        image.tintColor = .black
        return image
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$25.42"
        label.textColor = .white
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.layer.cornerRadius = 14
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var productTitle: UILabel = {
        let label = UILabel()
        label.text = "Nest Doorbell"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var favButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(-55)
        }
        
        productImage.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-20)
            make.top.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(75)
        }
        
        contentView.addSubview(productTitle)
        productTitle.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(10)
            make.leading.equalTo(10)
        }
        
        contentView.addSubview(favButton)
        favButton.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.height.equalTo(27)
            make.width.equalTo(30)
            make.centerY.equalTo(productTitle)
        }
    }
    
}
