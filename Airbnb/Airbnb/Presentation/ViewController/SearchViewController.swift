//
//  SearchViewController.swift
//  Airbnb
//
//  Created by Jason on 10/24/23.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
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
        self.navigationItem.title = "숙소 찾기"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.tableView.backgroundColor = .orange
        self.tableView.estimatedRowHeight = 64
        self.tableView.separatorStyle = .none
        //TODO: - Cell Register 코드 작성
    }
    
    private func setLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            let safeArea = self.view.safeAreaLayoutGuide
            make.top.leading.trailing.bottom.equalTo(safeArea)
        }
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
