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
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let dataSource = HomeDataSource()
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
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.clipsToBounds = true
        self.collectionView.collectionViewLayout = self.configureOfCollectionViewLayout()
        self.collectionView.dataSource = dataSource
        self.collectionView.register(
            HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier
        )
        self.collectionView.register(PosterCell.self, forCellWithReuseIdentifier: PosterCell.identifier)
        self.collectionView.register(NearByTravelCell.self, forCellWithReuseIdentifier: NearByTravelCell.identifier)
        self.collectionView.register(RecommendationCell.self, forCellWithReuseIdentifier: RecommendationCell.identifier)
    }
    
    private func setupLayout() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureOfCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (sectionIndex: Int, _) -> NSCollectionLayoutSection? in
            return HomeCompositionalLayout(sectionIndex: sectionIndex).createLayout()
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchViewController = SearchViewController()
        self.navigationItem.title = "뒤로"
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
}
