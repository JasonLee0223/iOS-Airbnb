//
//  ViewController.swift
//  Airbnb
//
//  Created by Jason on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
}

//MARK: - [Method] Setup ViewController
extension ViewController {
    private func setupUI() {
        self.setupAttribures()
        self.setupLayout()
    }
    
    private func setupAttribures() {
        self.view.backgroundColor = .white
        let searchBar = UISearchBar()
        searchBar.placeholder = "어디로 여행가세요?"
        self.navigationItem.titleView = searchBar
    }
    
    private func setupLayout() {
        
    }
}

extension ViewController {
    
}
