//
//  SearchViewController.swift
//  Airbnb
//
//  Created by Jason on 10/24/23.
//

import UIKit

final class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private func setUI() {
        self.setAttributes()
        self.setLayout()
    }
    
    private func setAttributes() {
        self.view.backgroundColor = .white
        self.searchController.searchBar.placeholder = "어디로 여행가세요?"
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.automaticallyShowsCancelButton = false
        self.searchController.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "숙소 찾기"
    }
    
    
    
    private func setLayout() {
        
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let clearButton = UIBarButtonItem(title: "지우기", style: .plain, target: self, action: #selector(clearButtonTapped))
        self.navigationItem.rightBarButtonItem = clearButton
    }
    
    @objc func clearButtonTapped() {
        print("지우기 실행할 코드 작성")
    }
}
