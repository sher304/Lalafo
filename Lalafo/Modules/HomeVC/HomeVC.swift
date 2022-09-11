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
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: Scroll View
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = view.bounds
        scrollV.backgroundColor = .white
        return scrollV
    }()
    
    
    private lazy var searchBar: UISearchBar = {
        let searchB = UISearchBar()
        searchB.backgroundColor = .white
        searchB.searchTextField.leftView?.tintColor = .black
        searchB.autocorrectionType = .no
        searchB.backgroundImage = UIImage()
        searchB.searchTextField.backgroundColor = .white
        searchB.layer.cornerRadius = 15
        searchB.layer.masksToBounds = true
        searchB.placeholder = "Search"
        searchB.searchTextField.textColor = .black
        searchB.layer.borderWidth = 0.4
        searchB.layer.borderColor = UIColor.black.cgColor
        return searchB
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Setup Constraints
    private func setupView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.trailing.equalTo(-17)
            make.height.equalTo(50)
            make.top.equalTo(40)
        }
    }
}


extension HomeViewController: HomeView{
    
}
