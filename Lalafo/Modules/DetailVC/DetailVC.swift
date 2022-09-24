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
    func showNumber(number: Int)
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + CGFloat(heightFrame))
    
    var heightFrame: Int = 160
    
    private lazy var scrollV: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = view.bounds
        scrollV.backgroundColor = .customBG
        return scrollV
    }()
    
    private lazy var parentContentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.backgroundColor = .customBG
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(didBackTapped), for: .touchUpInside)
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
        button.backgroundColor = .customOrange
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didDescriptionTapped)))
        return label
    }()
    
    private lazy var addToCartParentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var subtractAmount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.backgroundColor = .customDark
        button.layer.cornerRadius = 40 / 2
        button.tintColor = .white
        return button
    }()
    
    private lazy var addAmount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.backgroundColor = .customDark
        button.layer.cornerRadius = 40 / 2
        button.tintColor = .white
        return button
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customOrange
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.addTarget(self, action: #selector(didCartTapped), for: .touchUpInside)
        
        return button
    }()
    
    var descriptionConstraint: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }
    
    private func setupViews(){
        view.addSubview(scrollV)
        scrollV.addSubview(parentContentView)
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .customBG
        
        parentContentView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.top.equalTo(10)
        }
        
        parentContentView.addSubview(productScreen)
        productScreen.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        parentContentView.addSubview(favButton)
        favButton.snp.makeConstraints { make in
            make.trailing.equalTo(-25)
            make.width.equalTo(30)
            make.height.equalTo(25)
            make.centerY.equalTo(productScreen)
        }
        
        parentContentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalTo(productScreen.snp.bottom).offset(10)
            make.height.equalTo(340)
            make.leading.trailing.equalToSuperview()
        }
        
        parentContentView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom).offset(120)
            make.bottom.equalToSuperview()
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
            self.descriptionConstraint = make.height.equalTo(80).constraint
        }
        
        view.addSubview(addToCartParentView)
        addToCartParentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.height.equalTo(75)
            make.bottom.equalToSuperview()
        }
        
        addToCartParentView.addSubview(subtractAmount)
        subtractAmount.snp.makeConstraints { make in
            make.leading.equalTo(35)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        addToCartParentView.addSubview(addAmount)
        addAmount.snp.makeConstraints { make in
            make.leading.equalTo(subtractAmount.snp.trailing).offset(40)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        addToCartParentView.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(subtractAmount.snp.trailing).offset(15)
        }
        
        addToCartParentView.addSubview(addToCartButton)
        addToCartButton.snp.makeConstraints { make in
            make.trailing.equalTo(-50)
            make.leading.equalTo(addAmount.snp.trailing).offset(30)
            make.bottom.equalTo(-15)
            make.top.equalTo(15)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func didBackTapped(){
        dismiss(animated: true)
    }
    
    var didTapped = true
    @objc func didDescriptionTapped(button: UIButton){
        if didTapped{
            heightFrame = 320
            self.view.layoutIfNeeded()
            didTapped = false
            animateDescription()
        }else{
            heightFrame = 160
            self.view.layoutIfNeeded()
            didTapped = true
            closeDescriptionAnimate()
        }
    }

    @objc private func didCartTapped(){
        presenter?.didCartTapped()
    }
    
    private func animateDescription(){
        UIView.animate(withDuration: 0.5) {
            self.descriptionConstraint?.update(offset: 400)
            self.view.layoutIfNeeded()
        }
    }
    
    private func closeDescriptionAnimate(){
        UIView.animate(withDuration: 0.5) {
            self.descriptionConstraint?.update(offset: 80)
            self.view.layoutIfNeeded()
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
    func showNumber(number: Int){
        DispatchQueue.main.async { [self] in
            productTitle.text = number.description
        }
    }
}


