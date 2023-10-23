//
//  HomeViewController.swift
//  Airbnb
//
//  Created by Jason on 10/7/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private let searchBar = UISearchBar()
    private let tapGesture = UITapGestureRecognizer()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
}

//MARK: - [Method] Setup HomeViewController
extension HomeViewController {
    private func setupUI() {
        self.setupAttribures()
        self.setupLayout()
    }
    
    private func setupAttribures() {
        self.view.backgroundColor = .white
        self.searchBar.placeholder = "어디로 여행가세요?"
        self.searchBar.delegate = self
        self.navigationItem.titleView = self.searchBar
        self.tapGesture.addTarget(self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        //TODO: - collectionViewLayout, Register dataSource, delegate 설정
    }
    
    private func setupLayout() { }
}

extension HomeViewController: UISearchBarDelegate {
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
    }
}
