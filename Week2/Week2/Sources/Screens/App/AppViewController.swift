//
//  AppViewController.swift
//  Week2
//
//  Created by 김승원 on 10/12/24.
//

import UIKit

class AppViewController: UIViewController {
    // MARK: - Properties
    private let appView = AppView()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = appView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupGesture()
    }
    
    // MARK: - Set Gesture
    private func setupGesture() {
        
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        // delegate
        appView.topBannerCollectoinView.dataSource = self
        appView.topBannerCollectoinView.delegate = self
        
        // register Cells
        appView.topBannerCollectoinView.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.cellIdentifier)
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "앱"
    }
    
    // MARK: - Selectors
}

// MARK: - UICollectionView DataSource
extension AppViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == appView.topBannerCollectoinView {
            return TopBannerModel.mockData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == appView.topBannerCollectoinView {
            guard let topBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCell.cellIdentifier, for: indexPath) as? TopBannerCell else { return UICollectionViewCell() }
            topBannerCell.configure(TopBannerModel.mockData[indexPath.row])
            return topBannerCell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension AppViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == appView.topBannerCollectoinView {
            return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
        }
        
        return CGSize(width: 0, height: 0)
    }
}
