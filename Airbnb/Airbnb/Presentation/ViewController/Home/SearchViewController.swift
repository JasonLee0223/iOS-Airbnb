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
        self.dataSource = SearchDataSource(items: tableItems)
        self.setUI()
    }
    
    var tableItems = [Destination]()
    private let searchController = UISearchController(searchResultsController: nil)
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var dataSource: SearchDataSource?
    
    private func setUI() {
        self.setupAttributes()
        self.setupLayout()
    }
    
    private func setupAttributes() {
        guard let layout = SearchCollectionViewLayout().createSearchLayout() else { return}
        self.view.backgroundColor = .white
        self.searchController.searchBar.placeholder = "어디로 여행가세요?"
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.automaticallyShowsCancelButton = false
        self.searchController.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = "숙소 찾기"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.clipsToBounds = true
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = dataSource
        self.collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: layout)
        self.collectionView.register(
            HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier
        )
        self.collectionView.register(TravelListCell.self, forCellWithReuseIdentifier: TravelListCell.identifier)
    }
    
    private func setupLayout() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
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
