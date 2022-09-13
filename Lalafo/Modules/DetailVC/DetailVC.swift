//
//  DetailViewController.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit
import ReadMoreTextView
import SnapKit

protocol DetailView: AnyObject{
    
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterService!
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    private lazy var productScreen: UILabel = {
        let label = UILabel()
        label.text = "Detail Product"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .regular)
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
    
    private lazy var productImage: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(ProductDetailCell.self, forCellWithReuseIdentifier: ProductDetailCell.identifier)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.backgroundColor = .customBG
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.isPagingEnabled = true
        return collectionV
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .customDark
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 60
        return view
    }()
    
    private lazy var productTitle: UILabel = {
        let label = UILabel()
        label.text = "Jordan Zoom Separate PF - Basketball Shoes"
        label.textColor = .white
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("$12.52", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        button.backgroundColor = .customOrage
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var descriptionLabel: ReadMoreTextView = {
        let textView = ReadMoreTextView()
        textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

        textView.attributedReadLessText = NSAttributedString(string: " Read less")
        let readMoreTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)
        ]
        let readLessTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 15)
        ]
        textView.maximumNumberOfLines = 4
        textView.attributedReadMoreText = NSAttributedString(string: "... Read more", attributes: readMoreTextAttributes)
        textView.attributedReadLessText = NSAttributedString(string: " Read less", attributes: readLessTextAttributes)
        textView.shouldTrim = true
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .customBG
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.top.equalTo(60)
        }
        
        view.addSubview(productScreen)
        productScreen.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(favButton)
        favButton.snp.makeConstraints { make in
            make.trailing.equalTo(-25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.centerY.equalTo(productScreen)
        }
        
        view.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalTo(productScreen.snp.bottom).offset(10)
            make.height.equalTo(340)
            make.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom)
        }
        
        contentView.addSubview(productTitle)
        productTitle.snp.makeConstraints { make in
            make.leading.equalTo(35)
            make.top.equalTo(20)
            make.width.equalTo(220)
            make.height.equalTo(70)
        }
        
        contentView.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.trailing.equalTo(-25)
            make.height.equalTo(45)
            make.leading.equalTo(productTitle.snp.trailing).offset(10)
            make.centerY.equalTo(productTitle)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(35)
            make.trailing.equalTo(-35)
            make.top.equalTo(productTitle.snp.bottom).offset(15)
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailCell.identifier, for: indexPath) as? ProductDetailCell else { return ProductDetailCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.productImage.frame.width, height: self.productImage.frame.height)
    }
    
}

extension DetailViewController: DetailView{
    
}


