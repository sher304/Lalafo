//
//  ViewController.swift
//  Lalafo
//
//  Created by Шермат Эшеров on 10/9/22.
//

import UIKit
import SnapKit

protocol HomeView: AnyObject{
    
}

class HomeViewController: UIViewController {
    
    
    //MARK: Link With Presenter
    var presenter: HomePresenterService!
    
    //MARK: Content Size
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 360)
    
    //MARK: Content View
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.backgroundColor = UIColor.customBG
        return view
    }()
    
    //MARK: Scroll View
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = view.bounds
        scrollV.backgroundColor = UIColor.customBG
        return scrollV
    }()
    
    //MARK: Search Bar
    private lazy var searchBar: UISearchBar = {
        let searchB = UISearchBar()
        searchB.backgroundColor = .white
        searchB.autocorrectionType = .no
        searchB.backgroundImage = UIImage()
        searchB.searchTextField.backgroundColor = .white
        searchB.layer.cornerRadius = 15
        searchB.layer.masksToBounds = true
        searchB.placeholder = "Search"
        searchB.searchTextField.textColor = .black
        return searchB
    }()
    
    private lazy var balancedCartView: UIView = {
        let view = UIView()
        view.backgroundColor = .customDark
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.textColor = .customBG
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var visaLabel: UILabel = {
        let label = UILabel()
        label.text = "VISA"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var cashLabel: UILabel = {
        let label = UILabel()
        label.text = "$230.0"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var hashIdLabel: UILabel = {
        let label = UILabel()
        label.text = "****2301"
        label.textColor = .customBG
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.backgroundColor = .customBG
        collectionV.showsHorizontalScrollIndicator = false
        return collectionV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Setup Views
    private func setupView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupConstraints()
    }
    
    //MARK: Setup Constraints
    private func setupConstraints(){
        contentView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.height.equalTo(50)
            make.top.equalTo(40)
        }
        
        contentView.addSubview(balancedCartView)
        balancedCartView.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.height.equalTo(140)
            make.top.equalTo(searchBar.snp.bottom).offset(30)
        }
        
        balancedCartView.addSubview(balanceLabel)
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(18)
            make.top.equalTo(25)
        }
        
        balancedCartView.addSubview(visaLabel)
        visaLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-18)
            make.centerY.equalTo(balanceLabel)
        }
        
        balancedCartView.addSubview(cashLabel)
        cashLabel.snp.makeConstraints { make in
            make.leading.equalTo(18)
            make.bottom.equalTo(-30)
        }
        balancedCartView.addSubview(hashIdLabel)
        hashIdLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-18)
            make.centerY.equalTo(cashLabel)
        }
        
        contentView.addSubview(categoryCollection)
        categoryCollection.snp.makeConstraints { make in
            make.leading.equalTo(18)
            make.trailing.equalToSuperview()
            make.top.equalTo(balancedCartView.snp.bottom).offset(40)
            make.height.equalTo(80)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return CategoryCell()}
        
        return cell
    }
}

extension HomeViewController: HomeView{
    
}

