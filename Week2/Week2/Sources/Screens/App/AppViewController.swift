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
        setupActions()
    }
    
    // MARK: - Set up Actions
    private func setupActions() {
        appView.essentialAppButtonView.isUserInteractionEnabled = true
        let essentialTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapEssentialButton))
        appView.essentialAppButtonView.addGestureRecognizer(essentialTapGesture)
        
        appView.focusAppButtonView.isUserInteractionEnabled = true
        let focusTapGesture = UITapGestureRecognizer(target: self, action: #selector(didtapFocusButton))
        appView.focusAppButtonView.addGestureRecognizer(focusTapGesture)
    }
    
    // MARK: - Set up CollectionView
    private func setupCollectionView() {
        // delegate
        appView.topBannerCollectionView.dataSource = self
        appView.topBannerCollectionView.delegate = self
        
        appView.essentialAppCollectionView.dataSource = self
        appView.essentialAppCollectionView.delegate = self
        
        appView.focusAppCollectionView.dataSource = self
        appView.focusAppCollectionView.delegate = self
        
        // register Cells
        appView.topBannerCollectionView.register(TopBannerCell.self, forCellWithReuseIdentifier: TopBannerCell.cellIdentifier)
        appView.essentialAppCollectionView.register(AppCollectionViewCell.self, forCellWithReuseIdentifier: AppCollectionViewCell.cellIdentifier)
        appView.focusAppCollectionView.register(AppCollectionViewCell.self, forCellWithReuseIdentifier: AppCollectionViewCell.cellIdentifier)
    }
    
    // MARK: - Set up NavigationBar
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "앱"
    }
    
    // MARK: - Selectors
    @objc
    private func didTapEssentialButton() {
        let appListVC = AppListViewController()
        appListVC.setupTitle("iPhone 필수 앱")
        self.navigationController?.pushViewController(appListVC, animated: true)
    }
    
    @objc
    private func didtapFocusButton() {
        let appListVC = AppListViewController()
        appListVC.setupTitle("지금 주목해야 할 앱")
        self.navigationController?.pushViewController(appListVC, animated: true)
    }
}

// MARK: - UICollectionView DataSource
extension AppViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == appView.topBannerCollectionView {
            return TopBannerModel.mockData.count
        }
        
        if collectionView == appView.essentialAppCollectionView {
            return AppModel.mockData.count
        }
        
        if collectionView == appView.focusAppCollectionView {
            return AppModel.mockData.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == appView.topBannerCollectionView {
            guard let topBannerCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TopBannerCell.cellIdentifier,
                for: indexPath
            ) as? TopBannerCell else {
                return UICollectionViewCell()
            }
            topBannerCell.configure(
                TopBannerModel.mockData[indexPath.row]
            )
            return topBannerCell
        }
        
        if collectionView == appView.essentialAppCollectionView {
            guard let appCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? AppCollectionViewCell else {
                return UICollectionViewCell()
            }
            appCollectionViewCell.configure(with: indexPath.row, appModel: AppModel.mockData[indexPath.row])
            return appCollectionViewCell
        }
        
        if collectionView == appView.focusAppCollectionView {
            guard let appCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppCollectionViewCell.cellIdentifier,
                for: indexPath
            ) as? AppCollectionViewCell else {
                return UICollectionViewCell()
            }
            appCollectionViewCell.configure(with: indexPath.row, appModel: AppModel.mockData.reversed()[indexPath.row])
            return appCollectionViewCell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension AppViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == appView.topBannerCollectionView {
            return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
        }
        
        if collectionView == appView.essentialAppCollectionView || collectionView == appView.focusAppCollectionView {
            return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height/3)
        }
        
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == appView.essentialAppCollectionView {
            if indexPath.row == AppModel.mockData.count - 1 {
                let detailVC = DetailViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
        
        if collectionView == appView.focusAppCollectionView {
            if indexPath.row == 0 {
                let detailVC = DetailViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}
